export type PaymentSummaryItem = {
  label: string;
  amount: string;
}

export type PaymentOptions = {
  merchantName: string;
  merchantId: string;
  items: PaymentSummaryItem[];
}

export type ApplePayButtonStyle = 'white' | 'whiteOutline' | 'black';
export type ApplePayButtonType = 'plain' | 'buy' | 'setUp' | 'inStore' | 'donate';
