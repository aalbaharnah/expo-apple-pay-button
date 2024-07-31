import { requireNativeViewManager } from 'expo-modules-core';
import * as React from 'react';
import { View, Platform, ViewProps } from 'react-native';
import { ApplePayButtonStyle, ApplePayButtonType } from './ExpoApplePayButton.types';



const NativeView: React.ComponentType<ViewProps> =
  requireNativeViewManager('ExpoApplePayButton');


interface Props extends ViewProps {
  buttonStyle?: ApplePayButtonStyle;
  buttonLabel?: ApplePayButtonType;
}

export default function ExpoApplePayButtonView(props: Props) {
  if (Platform.OS !== 'ios') return <View {...props} />
  return <NativeView {...props} />;
}
