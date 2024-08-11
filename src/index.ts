import { Platform } from 'react-native';
import { PaymentOptions } from './ExpoApplePayButton.types';
import ExpoApplePayButtonModule from './ExpoApplePayButtonModule';


export {
  default as ApplePayButton,
} from './ExpoApplePayButtonView';

export * from './ExpoApplePayButton.types';

export async function startPaymentAsync(options: PaymentOptions) {
  return ExpoApplePayButtonModule.startPaymentAsync(options);
}

export async function canMakePaymentsAsync(): Promise<boolean> {
  if (Platform.OS !== 'ios') {
    return Promise.resolve(false);
  }
  return ExpoApplePayButtonModule.canMakePaymentsAsync();
}