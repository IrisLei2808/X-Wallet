//
//  Chain.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import Foundation

struct Chains: Hashable, Decodable {
    let id: String
    let name: String
    let code: String
    let price: Double
    let amount: Double
    let change: Double
    let imageName: String?
}
