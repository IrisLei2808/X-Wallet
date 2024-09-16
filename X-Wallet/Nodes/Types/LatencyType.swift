//
//  LatencyType.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation

enum LatencyType {
    case fast
    case normal
    case slow

    static func from(duration: Double) -> LatencyType {
        switch duration {
        case ..<1024:
            return .fast
        case ..<2048:
            return .normal
        default:
            return .slow
        }
    }
}
