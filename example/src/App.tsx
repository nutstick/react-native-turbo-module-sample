import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import TurboModuleSample from 'react-native-turbo-module-sample';

export default function App() {
  return (
    <View style={styles.container}>
      <Text>
        Result:
        {/* @ts-ignore */}
        {TurboModuleSample?.getString('nutstick') ?? 'not working'}
      </Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
