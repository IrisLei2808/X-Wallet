//
//  ChainsFilterViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import SwiftUI

struct ChainsFilterViewModel {
    let type: ChainsFilterType

    var value: String {
        switch type {
        case .allChains:
            Localized.Common.all
        case let .chain(chain):
            chain.rawValue.capitalized
        case let .chains(selected):
            "\(selected.count)"
        }
    }

    var title: String {
        Localized.Settings.Networks.title
    }
    
    var chainsImage: Image { Image(.settingsNetworks) }
}
