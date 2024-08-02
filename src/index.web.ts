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
  try {
    if (
      Platform.OS === 'web' &&
      typeof window !== 'undefined' &&
      'ApplePaySession' in window &&
      ApplePaySession?.canMakePayments?.()
    ) {
      return new ApplePaySession(3, data);
    }
    return null;
  } catch {
    return null;
  }
}

/**
 * @description This function starts the Apple Pay payment, in web it is required to pass the ApplePaySession and onValidateMerchant callback.
 */
export async function startPaymentAsync(options: PaymentOptions) {
  return new Promise<any>((resolve, reject) => {
    if (!options.applePaySession) {
      reject('ApplePaySession is required for web');
      return;
    }

    // * Validating the merchant
    options.applePaySession.onvalidatemerchant = async (event: any) => {
      const merchantSession = await options.onValidateMerchant?.(event.validationURL);
      options.applePaySession.completeMerchantValidation(merchantSession);
    };

    // * Handling the payment authorization
    options.applePaySession.onpaymentauthorized = async (event: any) => {
      resolve(JSON.stringify(event?.payment?.token));
    };

    // * Starting the payment session
    options.applePaySession.begin();
  })
}

export async function canMakePaymentsAsync(): Promise<boolean> {
  return ExpoApplePayButtonModule.canMakePaymentsAsync();
}

/**
 * @description This function ends Apple Pay session, it's required for only for web.
 */
export async function completePaymentSession(applePaySession?: ApplePaySession | null, error = false) {
  if (applePaySession) {
    if (error) {
      applePaySession.completePayment(ApplePaySession.STATUS_FAILURE);
    } else {
      applePaySession.completePayment(ApplePaySession.STATUS_SUCCESS);
    }
  }
}