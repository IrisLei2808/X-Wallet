//
//  NetworkFeeScene.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import SwiftUI
import Components
import Primitives

struct NetworkFeeScene: View {
    @Environment(\.dismiss) private var dismiss

    private var model: NetworkFeeViewModel

    private var action: ((FeePriority) -> Void)

    init(model: NetworkFeeViewModel, action: @escaping ((FeePriority) -> Void)) {
        self.model = model
        self.action = action
    }

    var body: some View {
        List {
            Section {
                ForEach(model.feeRatesViewModels) { feeRate in
                    ListItemSelectionView(
                        title: feeRate.title,
                        titleExtra: .none,
                        subtitle: feeRate.value,
                        subtitleExtra: .none,
                        selectionDirection: .left,
                        value: feeRate.feeRate.priority,
                        selection: model.selectedFeeRate?.priority,
                        action: action)
                }
            } footer: {
                Text(Localized.FeeRates.info)
                    .textStyle(.caption)
                    .multilineTextAlignment(.leading)
                    .headerProminence(.increased)
            }
            ListItemView(
                title: model.networkFeeTitle,
                subtitle: model.networkFeeValue,
                subtitleExtra: model.networkFeeFiatValue,
                placeholders: [.subtitle]
            )
        }
        .navigationTitle(Localized.Transfer.networkFee)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    dismiss()
                } label: {
                    Text(Localized.Common.done)
                }
            }
        }
    }
}
