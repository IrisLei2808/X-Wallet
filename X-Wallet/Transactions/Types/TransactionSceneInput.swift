//
//  TransactionSceneInput.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Primitives
import Store

struct TransactionSceneInput {
    let transactionId: String
    let walletId: WalletId

    var transactionRequest: TransactionsRequest {
        TransactionsRequest(
            walletId: walletId.id,
            type: .transaction(id: transactionId),
            limit: 1
        )
    }
}
