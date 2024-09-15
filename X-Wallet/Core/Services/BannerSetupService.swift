//
//  BannerSetupService.swift
//  X-Wallet
//
//  Created by Duc Le on 9/14/24.
//

import Foundation
import Primitives
import Store

struct BannerSetupService {

    let store: BannerStore
    let preferences: Preferences

    init(
        store: BannerStore,
        preferences: Preferences = .main
    ) {
        self.store = store
        self.preferences = preferences
    }

    func setup() throws {
        // Adding staking for all chains
    }

    func setupWallet(wallet: Wallet) throws  {
        // Adding XRP activation fee banner
        try store.addBanner(
            Banner(wallet: wallet, asset: Chain.xrp.asset, event: .accountActivation, state: .active)
        )
    }
}
