//
//  ChartService.swift
//  X-Wallet
//
//  Created by Duc Le on 9/10/24.
//

import Foundation
import GemAPI
import Primitives
import Store

struct ChartService {
    let chartProvider: GemAPIChartService
    
    init(
        chartProvider: GemAPIChartService = GemAPIService.shared
    ) {
        self.chartProvider = chartProvider
    }
    
    func getCharts(assetId: AssetId, period: ChartPeriod, currency: String) async throws -> Primitives.Charts {
        return try await chartProvider
            .getCharts(assetId: assetId, currency: currency, period: period.rawValue)
    }
}

