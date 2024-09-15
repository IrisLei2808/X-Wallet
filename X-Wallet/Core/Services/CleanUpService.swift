//
//  CleanUpService.swift
//  X-Wallet
//
//  Created by Duc Le on 9/14/24.
//

import Foundation
import Keystore
import Store

struct CleanUpService {
    
    let keystore: any Keystore
    let preferences: Preferences

    init(
        keystore: any Keystore,
        preferences: Preferences = .standard
    ) {
        self.keystore = keystore
        self.preferences = preferences
    }
    
    func initialSetup() throws {
        
    }
    
    func onDeleteAllWallets() throws {

    }
}
