//
//  WelcomeViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Settings
import Keystore
import GemstonePrimitives

struct WelcomeViewModel {
    
    let keystore: any Keystore
    
    init(
        keystore: any Keystore
    ) {
        self.keystore = keystore
    }
    
    var title: String {
        return Localized.Welcome.title
    }
    
//    var legalText: String {
//        Localized.Welcome.Legal.concent(
//            PublicConstants.url(.termsOfService).absoluteString,
//            PublicConstants.url(.privacyPolicy).absoluteString
//        )
//    }
}
