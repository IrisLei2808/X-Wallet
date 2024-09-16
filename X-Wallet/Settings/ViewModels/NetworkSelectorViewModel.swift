//
//  NetworkSelectorViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Primitives

struct NetworkSelectorViewModel {
    var title: String { Localized.Settings.Networks.title }

    let isMultipleSelectionEnabled: Bool
    let chains: [Chain]

    var selectedChains: Set<Chain>

    init(chains: [Chain], selectedChains: [Chain], isMultipleSelectionEnabled: Bool) {
        self.isMultipleSelectionEnabled = isMultipleSelectionEnabled
        self.chains = chains
        self.selectedChains = Set(selectedChains)
    }

    var cancelButtonTitle: String {
        Localized.Common.cancel
    }

    var clearButtonTitle: String {
        Localized.Filter.clear
    }

    var doneButtonTitle: String {
        Localized.Common.done
    }
}

// MARK: - Business Logic

extension NetworkSelectorViewModel {
    mutating func toggle(chain: Chain) {
        if selectedChains.contains(chain) {
            selectedChains.remove(chain)
        } else {
            selectedChains.insert(chain)
        }
    }

    mutating func clean() {
        selectedChains = []
    }
}

// MARK: - ChainFilterable

extension NetworkSelectorViewModel: ChainFilterable { }
