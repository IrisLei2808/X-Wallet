//
//  LatencyMeasureService.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Style

struct LatencyMeasureService {
    static func measure<T>(for asyncFunction: @escaping () async throws -> T) async throws -> (duration: Double, value: T) {
        let start = Date()
        let value = try await asyncFunction()
        let end = Date()
        let duration = end.timeIntervalSince(start) * 1000 // Convert to milliseconds
        return (duration: duration, value: value)
    }
}
