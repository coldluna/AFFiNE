import type {
  ClipboardHandlers,
  ConfigStorageHandlers,
  DebugHandlers,
  ExportHandlers,
  UIHandlers,
  UpdaterHandlers,
} from '@affine/electron-api';
import { ipcMain } from 'electron';

import { clipboardHandlers } from './clipboard';
import { configStorageHandlers } from './config-storage';
import { exportHandlers } from './export';
import { getLogFilePath, logger, revealLogFile } from './logger';
import { uiHandlers } from './ui/handlers';
import { updaterHandlers } from './updater';

export const debugHandlers = {
  revealLogFile: async () => {
    return revealLogFile();
  },
  logFilePath: async () => {
    return getLogFilePath();
  },
};

type WrapHandlers<T extends { [k: string]: (...args: any) => any }> = {
  [K in keyof T]: (
    e: Electron.IpcMainInvokeEvent,
    ...args: Parameters<T[K]>
  ) => ReturnType<T[K]>;
};

type AllHandlers = {
  debug: WrapHandlers<DebugHandlers>;
  clipboard: WrapHandlers<ClipboardHandlers>;
  export: WrapHandlers<ExportHandlers>;
  ui: WrapHandlers<UIHandlers>;
  updater: WrapHandlers<UpdaterHandlers>;
  configStorage: WrapHandlers<ConfigStorageHandlers>;
};

// Note: all of these handlers will be the single-source-of-truth for the apis exposed to the renderer process
export const allHandlers = {
  debug: debugHandlers,
  ui: uiHandlers,
  clipboard: clipboardHandlers,
  export: exportHandlers,
  updater: updaterHandlers,
  configStorage: configStorageHandlers,
} satisfies AllHandlers;

export const registerHandlers = () => {
  // TODO: listen to namespace instead of individual event types
  ipcMain.setMaxListeners(100);
  for (const [namespace, namespaceHandlers] of Object.entries(allHandlers)) {
    for (const [key, handler] of Object.entries(namespaceHandlers)) {
      const chan = `${namespace}:${key}`;
      ipcMain.handle(chan, async (e, ...args) => {
        const start = performance.now();
        try {
          const result = await handler(e, ...args);
          logger.info(
            '[ipc-api]',
            chan,
            args.filter(
              arg => typeof arg !== 'function' && typeof arg !== 'object'
            ),
            '-',
            (performance.now() - start).toFixed(2),
            'ms'
          );
          return result;
        } catch (error) {
          logger.error('[ipc]', chan, error);
        }
      });
    }
  }
};
