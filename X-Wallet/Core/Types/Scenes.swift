//
//  Scenes.swift
//  X-Wallet
//
//  Created by Duc Le on 9/14/24.
//

import Foundation
import Primitives

struct Scenes {
    struct CreateWallet: Hashable {}
    struct ImportWallet: Hashable {}
    struct FiatProviders: Hashable {}
    struct Notifications: Hashable {}
    struct Chains: Hashable {}
    struct AboutUs: Hashable {}
    struct Developer: Hashable {}
    struct Security: Hashable {}
    struct Wallets: Hashable {}
    struct Currency: Hashable {}
    struct WalletConnections: Hashable {}
    struct WalletConnectorScene: Hashable {}
    struct Validators: Hashable {}
    struct Stake: Hashable {}
    struct WalletConnect: Hashable {}
    struct VerifyPhrase: Hashable {
        let words: [String]
    }
    struct WalletDetail: Hashable {
        let wallet: Wallet
    }
    struct WalletSelectImage: Hashable {
        let wallet: Wallet
    }
    struct Price: Hashable {
        let asset: Primitives.Asset
    }
    struct Asset: Hashable {
        let asset: Primitives.Asset
    }
}