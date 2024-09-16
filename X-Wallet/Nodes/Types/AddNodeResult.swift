//
//  AddNodeResult.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import BigInt

struct AddNodeResult {
    let chainID: String
    let blockNumber: BigInt
    let latency: Latency
    let isInSync: Bool

    init(chainID: String, blockNumber: BigInt, isInSync: Bool, latency: Latency) {
        self.chainID = chainID
        self.blockNumber = blockNumber
        self.isInSync = isInSync
        self.latency = latency
    }
}