import { NativeModules } from 'react-native';
import type { TurboModule } from 'react-native-tscodegen-types';

export interface Spec extends TurboModule {
  getString(name: string): string;
  getArray(name: string): ReadonlyArray<string>;
  getObject(name: string): Object;
  getPromise(name: string): Promise<string>;
  addListener(cb: (name: string) => void): void;
}

const { MySampleTurboModule } = NativeModules;

export default MySampleTurboModule as Spec;
