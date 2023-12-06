import { getOrCreateWindow } from '../main-window';
import {
  getOnboardingWindow,
  getOrCreateOnboardingWindow,
} from '../onboarding';
import { launchStage } from './stage';

/**
 * Launch app depending on launch stage
 */
export function launch() {
  const stage = launchStage.value;
  if (stage === 'main') {
    getOrCreateWindow().catch(e => {
      console.error('Failed to restore or create window:', e);
    });

    getOnboardingWindow()
      .then(w => w?.destroy())
      .catch(e => console.error('Failed to destroy onboarding window:', e));
  }
  if (stage === 'onboarding')
    getOrCreateOnboardingWindow().catch(e => {
      console.error('Failed to restore or create onboarding window:', e);
    });
}
