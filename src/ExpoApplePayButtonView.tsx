import { requireNativeViewManager } from 'expo-modules-core';
import * as React from 'react';
import { View, Platform, ViewProps, GestureResponderEvent, Pressable } from 'react-native';
import { ApplePayButtonStyle, ApplePayButtonType } from './ExpoApplePayButton.types';



const NativeView: React.ComponentType<ViewProps> = Platform.OS === 'android' ? View : requireNativeViewManager('ExpoApplePayButton');


interface Props extends ViewProps {
  buttonStyle?: ApplePayButtonStyle;
  buttonLabel?: ApplePayButtonType;
  onPress?: ((event: GestureResponderEvent) => void) | undefined
}

export default function ExpoApplePayButtonView({ onPress, ...props }: Props) {
  if (Platform.OS !== 'ios') return <View {...props} />
  return <NativeView {...props} />;
}
