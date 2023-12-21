import type {
  ConfigStorageHandler,
  DBHandlers,
  DebugHandlers,
  DialogHandlers,
  EventMap,
  ExportHandlers,
  UIHandlers,
  UpdaterHandlers,
  WorkspaceHandlers,
} from '@affine/electron-api';
import type { Environment, RuntimeConfig } from '@affine/env/global';

declare global {
  interface Window {
    appInfo: {
      electron: boolean;
    };
    apis: {
      db: DBHandlers;
      debug: DebugHandlers;
      dialog: DialogHandlers;
      export: ExportHandlers;
      ui: UIHandlers;
      updater: UpdaterHandlers;
      workspace: WorkspaceHandlers;
      configStorage: ConfigStorageHandler;
    };
    events: EventMap;
    affine: {
      ipcRenderer: {
        send(channel: string, ...args: any[]): void;
        invoke(channel: string, ...args: any[]): Promise<any>;
        on(
          channel: string,
          listener: (event: Electron.IpcRendererEvent, ...args: any[]) => void
        ): this;
        once(
          channel: string,
          listener: (event: Electron.IpcRendererEvent, ...args: any[]) => void
        ): this;
        removeListener(
          channel: string,
          listener: (event: Electron.IpcRendererEvent, ...args: any[]) => void
        ): this;
      };
    };
  }

  // eslint-disable-next-line no-var
  var process: {
    env: Record<string, string>;
  };
  // eslint-disable-next-line no-var
  var environment: Environment;
  // eslint-disable-next-line no-var
  var runtimeConfig: RuntimeConfig;
  // eslint-disable-next-line no-var
  var $AFFINE_SETUP: boolean | undefined;
  /**
   * Inject by https://www.npmjs.com/package/@sentry/webpack-plugin
   */
  // eslint-disable-next-line no-var
  var SENTRY_RELEASE: { id: string } | undefined;
}

declare module '@blocksuite/store' {
  interface PageMeta {
    favorite?: boolean;
    subpageIds: string[];
    // If a page remove to trash, and it is a subpage, it will remove from its parent `subpageIds`, 'trashRelate' is use for save it parent
    trashRelate?: string;
    trash?: boolean;
    trashDate?: number;
    updatedDate?: number;
    mode?: 'page' | 'edgeless';
    jumpOnce?: boolean;
    // todo: support `number` in the future
    isPublic?: boolean;
  }
}
