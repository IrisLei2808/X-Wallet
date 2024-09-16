//
//  SelectAssetType.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation

enum SelectAssetType: String, Identifiable {
    case send
    case receive
    case buy
    case swap
    case stake
    case manage
    case hidden
    
    var id: String {
        return rawValue
    }
}
