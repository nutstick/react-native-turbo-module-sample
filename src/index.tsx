// import { TurboModuleRegistry } from 'react-native-tscodegen-types';
import type { TurboModule } from 'react-native-tscodegen-types';

export interface Spec extends TurboModule {
  getString(name: string): string;
  getArray(name: string): ReadonlyArray<string>;
  getObject(name: string): Object;
  getPromise(name: string): Promise<string>;
  addListener(cb: (name: string) => void): void;
}

// @ts-ignore
const TurboModuleSample = global.mySampleTurboModule;
export default TurboModuleSample;

// TODO: After enable TurboModule
// export default TurboModuleRegistry.getEnforcing<Spec>(
//   'MySampleTurboModule'
// ) as Spec;
