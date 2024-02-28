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
    
    init() {
        super.init(frame: CGRect.zero)
        self.button = PKPaymentButton(paymentButtonType: .plain, paymentButtonStyle: .black)
        self.button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        self.addSubview(self.button)
    }
    
    @objc func buttonTapped() {
        print("button tapped")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.button.frame = self.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
