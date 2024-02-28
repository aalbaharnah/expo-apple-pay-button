export type PaymentSummaryItem = {
  label: string;
  amount: string;
}

export type PaymentOptions = {
  merchantName: string;
  merchantId: string;
  items: PaymentSummaryItem[];
}