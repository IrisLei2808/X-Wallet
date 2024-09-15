//
//  AssetSceneInput.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Primitives
import Store

struct AssetSceneInput {

    let walletId: WalletId
    let assetId: AssetId

    static let transactionsLimit = 25

    var assetRequest: AssetRequest {
        return AssetRequest(walletId: walletId.id, assetId: assetId.identifier)
    }
    
    var transactionsRequest: TransactionsRequest {
        return TransactionsRequest(walletId: walletId.id, type: .asset(assetId: assetId), limit: Self.transactionsLimit)
    }

    var bannersRequest: BannersRequest {
        return BannersRequest(
            walletId: walletId.id,
            assetId: assetId.identifier,
            events: BannerEvent.allCases
        )
    }
}
