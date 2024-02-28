import { StyleSheet, Text, View } from 'react-native';

import * as ExpoApplePayButton from 'expo-apple-pay-button';

export default function App() {
  return (
    <View style={styles.container}>
      <Text>{ExpoApplePayButton.hello()}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
