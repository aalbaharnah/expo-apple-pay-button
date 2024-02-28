import * as React from 'react';

import { ExpoApplePayButtonViewProps } from './ExpoApplePayButton.types';

export default function ExpoApplePayButtonView(props: ExpoApplePayButtonViewProps) {
  return (
    <div>
      <span>{props.name}</span>
    </div>
  );
}
