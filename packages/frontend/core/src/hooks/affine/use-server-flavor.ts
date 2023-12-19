import { serverConfigQuery } from '@affine/graphql';
import type { BareFetcher, Middleware } from 'swr';

import { useQueryImmutable } from '../use-query';

const wrappedFetcher = (fetcher: BareFetcher<any> | null, ...args: any[]) =>
  fetcher?.(...args).catch(() => null);

const errorHandler: Middleware = useSWRNext => (key, fetcher, config) => {
  return useSWRNext(key, wrappedFetcher.bind(null, fetcher), config);
};

export const useServerFlavor = () => {
  const { data: config, error } = useQueryImmutable(
    { query: serverConfigQuery },
    {
      use: [errorHandler],
    }
  );

  if (error || !config) {
    return 'local';
  }

  return config.serverConfig.flavor;
};

export const useSelfHosted = () => {
  const serverFlavor = useServerFlavor();

  return ['local', 'selfhosted'].includes(serverFlavor);
};
