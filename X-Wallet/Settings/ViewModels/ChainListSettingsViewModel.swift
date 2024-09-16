//
//  ChainListSettingsViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Primitives
import Settings

struct ChainListSettingsViewModel {
    var title: String {
        return Localized.Settings.Networks.title
    }
}

// MARK: - ChainFilterable

extension ChainListSettingsViewModel: ChainFilterable {
    var chains: [Chain] {
        AssetConfiguration.allChains
    }
}
