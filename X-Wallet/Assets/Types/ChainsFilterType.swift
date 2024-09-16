//
//  ChainsFilterType.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Primitives
import Settings

enum ChainsFilterType {
    case allChains
    case chain(name: Chain)
    case chains(selected: [Chain])

    static let primary = ChainsFilterType.allChains

    init(selectedChains: [Chain]) {
        switch selectedChains.count {
        case 0: self = .allChains
        case 1: self = .chain(name: selectedChains[0])
        default: self = .chains(selected: selectedChains)
        }
    }
}

extension ChainsFilterType: Equatable { }
