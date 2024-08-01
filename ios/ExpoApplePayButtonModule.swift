import ExpoModulesCore
import PassKit

internal struct PaymentOptions: Record {
  @Field var merchantName: String
  @Field var merchantId: String
  @Field var items: [NSDictionary]
}

public class ExpoApplePayButtonModule: Module {
  public func definition() -> ModuleDefinition {
      var paymenthandler: ExpoApplePayButtonHandler!
      
      Name("ExpoApplePayButton")

      AsyncFunction("canMakePaymentsAsync") { (promise: Promise) in
          promise.resolve(PKPaymentAuthorizationViewController.canMakePayments())
      }.runOnQueue(.main)

      AsyncFunction("startPaymentAsync") { (options: PaymentOptions, promise: Promise) in
          if(!PKPaymentAuthorizationViewController.canMakePayments()){
              print("Apple Pay is not supported on this device")
              promise.reject("400", "Apple Pay is not supported on this device");
              return;
          }

          // check if options have merchantName, merchantId, and items
          if(options.merchantName.isEmpty || options.merchantId.isEmpty || options.items.isEmpty){
              promise.reject("400", "Merchant Name, Merchant Id, and Items are required");
              return;
          }
          
          paymenthandler = ExpoApplePayButtonHandler()
          
          var paymentSummaryItems = [PKPaymentSummaryItem]()
          for item in options.items {
              let label = item["label"] as! String
              let amount = item["amount"] as! String
              paymentSummaryItems.append(PKPaymentSummaryItem(label: label, amount: NSDecimalNumber(string: amount), type: .final))
          }

          let total = options.items.reduce(0.0) { (result, item) -> Double in
              let amount = item["amount"] as! String
              return result + Double(amount)!
          }

          paymentSummaryItems.append(PKPaymentSummaryItem(label: options.merchantName , amount: NSDecimalNumber(string: String(total)), type: .final))

          paymenthandler.startPayment(
            items: paymentSummaryItems,
            merchantIdentifier: options.merchantId,
            completion: { (success, data) in
                if(success){
                    promise.resolve(data)
                } else {
                    promise.reject("400", data?["Error"] as! String)
                }
            } 
        );
        
      }.runOnQueue(.main)

      View(ApplePayButtonView.self) {
          Prop("buttonStyle") { (view, buttonStyle: String) in
            view.applePayButton.setButtonTypeAndStyle("", buttonStyle)
          }
          
          Prop("buttonLabel") { (view, buttonLabel: String) in
            view.applePayButton.setButtonTypeAndStyle(buttonLabel, "")
          }
      }
  }
}
