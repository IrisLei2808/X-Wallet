//
//  SwapError.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation

enum SwapError: LocalizedError {
    case noQuoteData

    var errorDescription: String? {
        switch self {
        case .noQuoteData:
            return Localized.Errors.Swap.noQuoteData
        }
    }
}
