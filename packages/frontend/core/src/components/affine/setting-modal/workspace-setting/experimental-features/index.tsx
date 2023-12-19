import { SettingHeader } from '@affine/component/setting-components';
import { useAFFiNEI18N } from '@affine/i18n/hooks';

import { ExperimentalFeatureArts } from './arts';
import * as styles from './index.css';

const ExperimentalFeaturesPrompt = () => {
  const t = useAFFiNEI18N();
  return (
    <div className={styles.promptRoot}>
      <div>
        {t[
          'com.affine.settings.workspace.experimental-features.prompt-header'
        ]()}
      </div>
      <ExperimentalFeatureArts />
    </div>
  );
};

const ExperimentalFeaturesMain = () => {
  const t = useAFFiNEI18N();

  return (
    <>
      <SettingHeader
        title={t[
          'com.affine.settings.workspace.experimental-features.header.plugins'
        ]()}
      />
      TODO
    </>
  );
};

const checked = false;

export const ExperimentalFeatures = () => {
  if (!checked) {
    return <ExperimentalFeaturesPrompt />;
  } else {
    return <ExperimentalFeaturesMain />;
  }
};
