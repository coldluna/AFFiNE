import type { CallbackMap } from '@affine/sdk/entry';
import { assertExists } from '@blocksuite/global/utils';
import { atomWithStorage } from 'jotai/utils';
import { atom } from 'jotai/vanilla';

export const builtinPluginPaths = new Set(runtimeConfig.builtinPlugins);

const pluginCleanupMap = new Map<string, Set<() => void>>();

export function addCleanup(
  pluginName: string,
  cleanup: () => void
): () => void {
  if (!pluginCleanupMap.has(pluginName)) {
    pluginCleanupMap.set(pluginName, new Set());
  }
  const cleanupSet = pluginCleanupMap.get(pluginName);
  assertExists(cleanupSet);
  cleanupSet.add(cleanup);
  return () => {
    cleanupSet.delete(cleanup);
  };
}

export function invokeCleanup(pluginName: string) {
  pluginCleanupMap.get(pluginName)?.forEach(cleanup => cleanup());
  pluginCleanupMap.delete(pluginName);
}

export const pluginPackageJson = atom<any[]>([]);

export const enabledPluginAtom = atomWithStorage('affine-enabled-plugin', [
  '@affine/image-preview-plugin',
]);

export const pluginHeaderItemAtom = atom<
  Record<string, CallbackMap['headerItem']>
>({});

export const pluginSettingAtom = atom<Record<string, CallbackMap['setting']>>(
  {}
);

export const pluginEditorAtom = atom<Record<string, CallbackMap['editor']>>({});

export const pluginWindowAtom = atom<
  Record<string, (root: HTMLElement) => () => void>
>({});
