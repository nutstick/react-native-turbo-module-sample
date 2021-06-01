// import { TurboModuleRegistry } from 'react-native-tscodegen-types';
import type { TurboModule } from 'react-native-tscodegen-types';

export interface Spec extends TurboModule {
  getString(name: string): string;
  getArray(name: string): ReadonlyArray<string>;
  getObject(name: string): Object;
  getPromise(name: string): Promise<string>;
  addListener(cb: (name: string) => void): void;
}

declare global {
  var mySampleTurboModule: Spec;
}

const TurboModuleSample = global.mySampleTurboModule;

export default TurboModuleSample;
