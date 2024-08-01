//
//  ApplePayButton.swift
//  ExpoApplePayButton
//
//  Created by Ali Albaharnah on 28/02/2024.
//

import Foundation
import ExpoModulesCore
import UIKit
import PassKit

class ApplePayButton: UIView {
    var button: PKPaymentButton!
    var paymentButtonStyle: PKPaymentButtonStyle = .black
    var paymentButtonType: PKPaymentButtonType = .plain
    
    init() {
        super.init(frame: CGRect.zero)
        self.button = PKPaymentButton(paymentButtonType: self.paymentButtonType, paymentButtonStyle: self.paymentButtonStyle)
        self.addSubview(self.button)
    }
    

    @objc func setButtonTypeAndStyle(_ type: String, _ style: String) {
        // remove the button from the view
        self.button.removeFromSuperview()

        switch type {
        case "plain":
            self.paymentButtonType = .plain
        case "buy":
            self.paymentButtonType = .buy
        case "setUp":
            self.paymentButtonType = .setUp
        case "inStore":
            self.paymentButtonType = .inStore
        case "donate":
            self.paymentButtonType = .donate
        case "addMoney":
            if #available(iOS 14.0, *) {
                self.paymentButtonType = .addMoney
            } else {
                self.paymentButtonType = .plain
            }
        case "book":
            self.paymentButtonType = .book
        case "checkout":
            self.paymentButtonType = .checkout
        case "continue":
            if #available(iOS 15.0, *) {
                self.paymentButtonType = .continue
            } else {
                self.paymentButtonType = .plain
            }
        case "contribute":
            if #available(iOS 14.0, *) {
                self.paymentButtonType = .contribute
            } else {
                self.paymentButtonType = .plain
            }
        case "order":
            if #available(iOS 14.0, *) {
                self.paymentButtonType = .order
            } else {
                self.paymentButtonType = .plain
            }
        case "reload":
            if #available(iOS 14.0, *) {
                self.paymentButtonType = .reload
            } else {
                self.paymentButtonType = .plain
            }
        case "rent":
            if #available(iOS 14.0, *) {
                self.paymentButtonType = .rent
            } else {
                self.paymentButtonType = .plain
            }
        case "subscribe":
            self.paymentButtonType = .subscribe
        case "support":
            if #available(iOS 14.0, *) {
                self.paymentButtonType = .support
            } else {
                self.paymentButtonType = .plain
            }
        case "tip":
            if #available(iOS 14.0, *) {
                self.paymentButtonType = .tip
            } else {
                self.paymentButtonType = .plain
            }
        case "topUp":
            if #available(iOS 14.0, *) {
                self.paymentButtonType = .topUp
            } else {
                self.paymentButtonType = .plain
            }
        default:
            self.paymentButtonType = .plain
        }

        switch style {
        case "black":
            self.paymentButtonStyle = .black
        case "white":
            self.paymentButtonStyle = .white
        case "outline":
            self.paymentButtonStyle = .whiteOutline
        default:
            if #available(iOS 14.0, *) {
                self.paymentButtonStyle = .automatic
            } else {
                self.paymentButtonStyle = .black
            }
        }

        self.button = PKPaymentButton(paymentButtonType: self.paymentButtonType, paymentButtonStyle: self.paymentButtonStyle)
        self.addSubview(self.button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.button.frame = self.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
