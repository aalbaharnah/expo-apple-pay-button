import { requireNativeViewManager } from 'expo-modules-core';
import * as React from 'react';

import { ExpoApplePayButtonViewProps } from './ExpoApplePayButton.types';

const NativeView: React.ComponentType<ExpoApplePayButtonViewProps> =
  requireNativeViewManager('ExpoApplePayButton');

export default function ExpoApplePayButtonView(props: ExpoApplePayButtonViewProps) {
  return <NativeView {...props} />;
}
