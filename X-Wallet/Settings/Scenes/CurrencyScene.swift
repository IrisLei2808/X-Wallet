//
//  CurrencyScene.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import SwiftUI
import Components
import Primitives

struct CurrencyScene: View {
    @ObservedObject var model: CurrencySceneViewModel
    
    init(
        model: CurrencySceneViewModel
    ) {
        self.model = model
    }
    
    var body: some View {
        List {
            ForEach(model.list) { section in
                Section(section.section) {
                    ForEach(section.values) { currency in
                        ListItemSelectionView(
                            title: currency.title,
                            titleExtra: .none,
                            subtitle: .none,
                            subtitleExtra: .none,
                            value: currency.value,
                            selection: model.currency
                        ) {
                            onSelect(currency: $0)
                        }
                    }
                }
            }
        }
        .navigationTitle(model.title)
    }
}

// MARK: - Actions

extension CurrencyScene {
    private func onSelect(currency: String) {
        model.currency = currency
    }
}
