import { requireNativeViewManager } from 'expo-modules-core';
import * as React from 'react';
import { View, Platform, ViewProps } from 'react-native';


const NativeView: React.ComponentType<ViewProps> =
  requireNativeViewManager('ExpoApplePayButton');

export default function ExpoApplePayButtonView(props: ViewProps) {
  if (Platform.OS !== 'ios') return <View {...props} />
  return <NativeView {...props} />;
}
