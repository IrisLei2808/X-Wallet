//
//  AddNodeService.swift
//  X-Wallet
//
//  Created by Duc Le on 9/12/24.
//

import Foundation
import Gemstone
import GemstonePrimitives
import Store
import Primitives

struct AddNodeService {
    let nodeStore: NodeStore
    
    func addNodes() throws {
        let configNodes = Config.shared.getNodes().map { (key, values) in
            ChainNodes(chain: key, nodes: values.map{ $0.node })
        }
        try nodeStore.addNodes(chainNodes: configNodes)
    }
    
    func addNode(_ node: ChainNodes) throws {
        try nodeStore.addNodes(chainNodes: [node])
    }
}

extension Gemstone.Node {
    var node: Primitives.Node {
        let priority = switch priority {
        case .high: 10
        case .medium: 5
        case .low: 1
        case .inactive: -1
        }
        let status: NodeState = priority > 0 ? .active : .inactive
        return Primitives.Node(
            url: url,
            status: status,
            priority: priority.asInt32)
    }
}
