//
//  RecipientAddress.swift
//  X-Wallet
//
//  Created by Duc Le on 9/14/24.
//

import Foundation

struct RecipientAddress {
    let name: String
    let address: String
}
extension RecipientAddress: Identifiable {
    var id: String {
        return String("\(name)\(address)")
    }
}
extension RecipientAddress: Hashable {}
