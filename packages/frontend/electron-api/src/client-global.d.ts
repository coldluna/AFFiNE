import type Electron from 'electron';

import type {
  ConfigStorageHandlers,
  DBHandlers,
  DebugHandlers,
  DialogHandlers,
  EventMap,
  ExportHandlers,
  UIHandlers,
  UpdaterHandlers,
  WorkspaceHandlers,
} from './index';

declare global {
  interface Window {
    appInfo: {
      electron: boolean;
      schema: string;
      windowName: string;
    };
    apis: {
      db: DBHandlers;
      debug: DebugHandlers;
      dialog: DialogHandlers;
      export: ExportHandlers;
      ui: UIHandlers;
      updater: UpdaterHandlers;
      workspace: WorkspaceHandlers;
      configStorage: ConfigStorageHandlers;
    };
    events: EventMap;
    affine: {
      ipcRenderer: {
        send(channel: string, ...args: any[]): void;
        invoke(channel: string, ...args: any[]): Promise<any>;
        on(
          channel: string,
          listener: (event: Electron.IpcRendererEvent, ...args: any[]) => void
        ): void;
        once(
          channel: string,
          listener: (event: Electron.IpcRendererEvent, ...args: any[]) => void
        ): void;
        removeListener(
          channel: string,
          listener: (event: Electron.IpcRendererEvent, ...args: any[]) => void
        ): void;
      };
    };
  }
}
