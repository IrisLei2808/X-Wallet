//
//  ChainServiceFactory.swift
//  X-Wallet
//
//  Created by Duc Le on 9/10/24.
//

import Foundation
import Primitives
import Blockchain

public protocol NodeURLFetchable {
    func node(for chain: Chain) -> URL
}

public class ChainServiceFactory {
    let nodeProvider: NodeURLFetchable
    
    init(nodeProvider: NodeURLFetchable) {
        self.nodeProvider = nodeProvider
    }
    
    func service(for chain: Chain) -> ChainServiceable {
        return ChainService.service(
            chain: chain,
            with: nodeProvider.node(for: chain)
        )
    }
}
