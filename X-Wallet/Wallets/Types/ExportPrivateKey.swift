//
//  ExportPrivateKey.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Primitives

struct ExportPrivateKey: Hashable {
    let chain: Chain
    let key: String
}
