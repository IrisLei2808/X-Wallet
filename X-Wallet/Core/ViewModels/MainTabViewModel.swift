//
//  MainTabViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/14/24.
//

import Foundation
import Primitives
import Store

struct MainTabViewModel {
    let wallet: Wallet

    var walletId: WalletId {
        wallet.walletId
    }

    var transactionsCountRequest: TransactionsCountRequest {
        TransactionsCountRequest(walletId: walletId.id, state: .pending)
    }
}
