//
//  NodeStatus.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import BigInt

enum NodeStatus {
    case result(blockNumber: BigInt, latency: Latency)
    case error(error: Error)
    case none
}
