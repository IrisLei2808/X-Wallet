//
//  AddTokenInput.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Primitives
import Settings

struct AddTokenInput {
    
    let chains: [Chain]

    var chain: Chain?
    var address: String?

    var hasManyChains: Bool {
        chains.count > 1
    }

    init(chains: [Chain]) {
        self.chains = chains
        self.chain = chains.first
    }
}
