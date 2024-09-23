import { Platform } from 'react-native';
import { PaymentOptions } from './ExpoApplePayButton.types';
import ExpoApplePayButtonModule from './ExpoApplePayButtonModule';

export {
  default as ApplePayButton,
} from './ExpoApplePayButtonView';

export * from './ExpoApplePayButton.types';

/**
 * @description This function initializes the Apple Pay session, it's required for only for web.
 */
export function initApplePaySession(data: ApplePayJS.ApplePayPaymentRequest): ApplePaySession | null {
  return null;
}

/**
 * @description This function starts the Apple Pay payment, in web it is required to pass the ApplePaySession and onValidateMerchant callback.
 */
export async function startPaymentAsync(options: PaymentOptions) {
  return ExpoApplePayButtonModule.startPaymentAsync(options);
}

export async function canMakePaymentsAsync(): Promise<boolean> {
  if (Platform.OS !== 'ios') {
    return Promise.resolve(false);
  }
  return ExpoApplePayButtonModule.canMakePaymentsAsync();
}

/**
 * @description This function ends Apple Pay session, it's required for only for web.
 */
export async function completePaymentSession(applePaySession?: ApplePaySession | null, error = false) {}