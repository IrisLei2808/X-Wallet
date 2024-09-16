//
//  NodeStatusViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Primitives
import Style

struct NodeStatusViewModel {
    let nodeStatus: NodeStatus

    func latestBlockText(title: String, formatter: ValueFormatter) -> String {
        let value = switch nodeStatus {
        case .result(let blockNumber, _): formatter.string(blockNumber, decimals: 0)
        case .error, .none: "-"
        }
        return "\(title): \(value)"
    }
    
    private var errorText: String {
        "\(Localized.Errors.error) \(Emoji.redCircle)"
    }

    var latencyText: String? {
        switch nodeStatus {
        case .result(let block, let latency):
            if block > 0 {
                return LatencyViewModel(latency: latency).title
            }
            return errorText
        case .error:
            return errorText
        case .none:
            return .none
        }
    }
}
