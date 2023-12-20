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

export const appInfo = (window as any).appInfo as {
  electron: boolean;
  schema: string;
  windowName: string;
} | null;
export const apis = (window as any).apis as {
  db: DBHandlers;
  debug: DebugHandlers;
  dialog: DialogHandlers;
  export: ExportHandlers;
  ui: UIHandlers;
  updater: UpdaterHandlers;
  workspace: WorkspaceHandlers;
  configStorage: ConfigStorageHandlers;
} | null;
export const events = (window as any).events as EventMap | null;
export const affine = (window as any).affine as {
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
} | null;
