//
//  Latency.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation

struct Latency {
    let type: LatencyType
    let value: Double

    static func from(duration: Double) -> Latency {
        Latency(
            type: LatencyType.from(duration: duration),
            value: duration
        )
    }
}
