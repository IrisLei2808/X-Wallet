//
//  RateService.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Store
import StoreKit

struct RateService {
    
    let preferences: Preferences = .standard

    func perform() {
        #if DEBUG
        #else
        if preferences.launchesCount >= 5 && !preferences.rateApplicationShown {
            rate()
            preferences.rateApplicationShown = true
        }
        #endif
    }
    
    func rate() {
        DispatchQueue.main.async {
            if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
            }
        }
    }
}