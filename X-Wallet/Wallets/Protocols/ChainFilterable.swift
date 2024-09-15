//
//  ChainFilterable.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Primitives
import Settings

protocol ChainFilterable {
    var chains: [Chain] { get }
    func filter(_ chain: Chain, query: String) -> Bool
}

extension ChainFilterable {
    func filter(_ chain: Chain, query: String) -> Bool {
        chain.asset.name.localizedCaseInsensitiveContains(query) ||
        chain.asset.symbol.localizedCaseInsensitiveContains(query) ||
        chain.rawValue.localizedCaseInsensitiveContains(query)
    }

    func filterChains(for query: String) -> [Chain] {
        guard !query.isEmpty else { return chains }
        return chains.filter { filter($0, query: query) }
    }
}
