//
//  ImportWalletType.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Primitives

enum ImportWalletType: Hashable {
    case multicoin
    case chain(Chain)
}
