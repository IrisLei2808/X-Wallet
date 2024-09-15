//
//  OnstartService.swift
//  X-Wallet
//
//  Created by Duc Le on 9/14/24.
//

import Foundation
import Store
import Keystore
import Settings
import Primitives

struct OnstartService {
    
    let assetsService: AssetsService
    let assetStore: AssetStore
    let nodeStore: NodeStore
    let keystore: any Keystore
    let preferences = Preferences()
    
    func migrations() {
        let preferences = PreferencesStore()
        
        do {
            try CleanUpService(keystore: keystore).initialSetup()
        } catch {
            NSLog("destroy initial files error: \(error)")
        }
        
        do {
            try keystore.setupChains(chains: AssetConfiguration.allChains)
        } catch {
            NSLog("keystore setup Chains error: \(error)")
        }
        do {
            try ImportAssetsService(
                nodeService: NodeService(nodeStore: nodeStore),
                assetsService: assetsService,
                assetStore: assetStore,
                preferences: preferences
            ).migrate()
        } catch {
            NSLog("migrations error: \(error)")
        }
        
        if !preferences.hasCurrency, let currency = Locale.current.currency {
            preferences.currency = (Currency(rawValue: currency.identifier) ?? .usd).rawValue
        }
    }
}
