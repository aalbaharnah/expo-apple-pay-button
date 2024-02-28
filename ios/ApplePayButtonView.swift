//
//  ApplePayButtonView.swift
//  ExpoApplePayButton
//
//  Created by Ali Albaharnah on 28/02/2024.
//

import ExpoModulesCore

class ApplePayButtonView : ExpoView {
    let applePayButton = ApplePayButton()

    required init(appContext: AppContext? = nil) {
        super.init(appContext: appContext)
         clipsToBounds = true
         addSubview(applePayButton)
    }

    override func layoutSubviews() {
        applePayButton.frame = bounds
    }
}
