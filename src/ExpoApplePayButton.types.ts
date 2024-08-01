export type PaymentSummaryItem = {
  label: string;
  amount: string;
}

export type PaymentOptions = {
  merchantName: string;
  merchantId: string;
  items: PaymentSummaryItem[];
}

export type ApplePayButtonStyle = "white" | "outline" | "black";
export type ApplePayButtonType =
  "plain"
  | "buy"
  | "setUp"
  | "inStore"
  | "donate"
  | "addMoney"
  | "book"
  | "checkout"
  | "continue"
  | "contribute"
  | "order"
  | "reload"
  | "rent"
  | "subscribe"
  | "support"
  | "tip"
  | "topUp"
