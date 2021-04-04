import { NativeModules } from 'react-native';

type TurboModuleSampleType = {
  multiply(a: number, b: number): Promise<number>;
};

const { TurboModuleSample } = NativeModules;

export default TurboModuleSample as TurboModuleSampleType;
