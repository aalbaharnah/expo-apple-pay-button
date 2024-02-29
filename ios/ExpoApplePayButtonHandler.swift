//
//  ExpoApplePayButtonHandler.swift
//  ExpoApplePayButton
//
//  Created by Ali Albaharnah on 28/02/2024.
//

import Foundation
import PassKit

struct ApplePaySource: Codable {
    var type = "applepay"
    var token: String
}

struct PaymentRequest: Codable {
    var amount: Int
    var description: String
    var publishable_api_key: String
    var source: ApplePaySource
}

typealias PaymentCompletionHandler = (Bool, [String: Any]?) -> Void

class ExpoApplePayButtonHandler: NSObject, PKPaymentAuthorizationControllerDelegate {
    
    var paymentController: PKPaymentAuthorizationController?
    var paymentStatus = PKPaymentAuthorizationStatus.failure
    var paymentDataJson: [String:Any]?
    var completionHandler: PaymentCompletionHandler!
    var presentViewController : UIViewController?

    func canMakePayments() -> Bool {
        return PKPaymentAuthorizationController.canMakePayments()
    }
    
    func startPayment(items:[PKPaymentSummaryItem], merchantIdentifier: String,  completion: @escaping PaymentCompletionHandler){
        self.completionHandler = completion;
        
        let payment = PKPaymentRequest()
        payment.paymentSummaryItems = items;
        payment.merchantIdentifier = merchantIdentifier;
        payment.supportedNetworks = [.amex, .visa, .masterCard, .mada]
        payment.merchantCapabilities = .capability3DS
        payment.countryCode = "SA"
        payment.currencyCode = "SAR"
        
        self.paymentController = PKPaymentAuthorizationController(paymentRequest: payment)
        
        self.paymentController?.delegate = self
        self.paymentController?.present(completion: { (presented: Bool) in
            if !presented  {
                self.completionHandler!(false, nil)
            }
        })
    }
    
    // DELEGATE METHODS
    func paymentAuthorizationController(
        _ controller: PKPaymentAuthorizationController,
        didAuthorizePayment payment: PKPayment,
        handler completion: @escaping (PKPaymentAuthorizationResult) -> Void
    ) {
      do {
          self.paymentStatus = PKPaymentAuthorizationStatus.success
          if let json = try JSONSerialization.jsonObject(with: payment.token.paymentData, options: []) as? [String: Any]{
              self.paymentDataJson = json
              completion(PKPaymentAuthorizationResult(status: PKPaymentAuthorizationStatus.success, errors: [Error]()))
          }
      } catch _ as NSError {
            completion(PKPaymentAuthorizationResult(status: PKPaymentAuthorizationStatus.failure, errors: [Error]()))
      }
    }
    
    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
        controller.dismiss(completion: {
            DispatchQueue.main.async {
                switch self.paymentStatus {
                    case .success:
                        self.completionHandler!(true, self.paymentDataJson);
                        break;
                    case .failure:
                        self.completionHandler!(false, ["Error": "FAILURE"])
                        break;
                    case .invalidBillingPostalAddress:
                        self.completionHandler!(false, ["Error": "INVALID_BILLING_POSTAL_ADDRESS"]);
                        break;
                    case .invalidShippingContact:
                        self.completionHandler!(false, ["Error": "INVALID_SHIPPING_CONTACT"]);
                        break;
                    case .pinIncorrect:
                        self.completionHandler!(false, ["Error": "PIN_INCORRECT"]);
                        break;
                    case .pinLockout:
                        self.completionHandler!(false, ["Error": "PIN_LOCKOUT"]);
                        break;
                    case .pinRequired:
                        self.completionHandler!(false, ["Error": "PIN_REQUIRED"]);
                        break;
                    default:
                        self.completionHandler!(false, ["Error": "UNKNOWN"])  
                }
            }
        })
    }
}

