//
//  LatencyViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Style

struct LatencyViewModel {
    
    let latency: Latency

    var title: String {
        "\(Localized.Common.latencyInMs(value)) \(colorEmoji)"
    }

    var colorEmoji: String {
        switch latency.type {
        case .fast: return Emoji.greenCircle
        case .normal: return Emoji.orangeCircle
        case .slow: return Emoji.redCircle
        }
    }

    var value: Int {
        return Int(latency.value)
    }
}
