//
//  FiatProvidersViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Primitives

struct FiatProvidersViewModel {
    var asset: Asset
    var quotes: [FiatQuote]

    var selectQuote: ((FiatQuote) -> Void)?

    var quotesViewModel: [FiatQuoteViewModel] {
        quotes.map { FiatQuoteViewModel(asset: asset, quote: $0) }
    }
}
