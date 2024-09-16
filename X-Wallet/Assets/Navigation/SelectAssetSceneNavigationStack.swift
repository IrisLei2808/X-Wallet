//
//  SelectAssetSceneNavigationStack.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import SwiftUI
import Primitives
import Components
import Style

struct SelectAssetSceneNavigationStack: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.keystore) private var keystore
    @Environment(\.assetsService) private var assetsService

    @State private var isPresentingAddToken: Bool = false
    @State private var isPresentingFilteringView: Bool = false

    @State private var model: SelectAssetViewModel

    init(model: SelectAssetViewModel) {
        _model = State(wrappedValue: model)
    }

    var body: some View {
        NavigationStack {
            SelectAssetScene(model: model, isPresentingAddToken: $isPresentingAddToken)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(Localized.Common.done) {
                            dismiss()
                        }
                        .bold()
                        .accessibilityIdentifier("cancel")
                    }
                    if model.showAddToken {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                isPresentingFilteringView = true
                            } label: {
                                if model.filterModel.isCusomFilteringSpecified {
                                    Image(systemName: SystemImage.filterFill)
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(Colors.whiteSolid, Colors.blue)
                                } else {
                                    Image(systemName: SystemImage.filter)
                                        .foregroundStyle(.primary)
                                }
                            }
                            .contentTransition(.symbolEffect(.replace))
                        }

                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                isPresentingAddToken = true
                            } label: {
                                Image(systemName: SystemImage.plus)
                            }
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $isPresentingAddToken) {
            AddTokenNavigationStack(
                wallet: model.wallet,
                isPresenting: $isPresentingAddToken,
                action: addAsset
            )
        }
        .sheet(isPresented: $isPresentingFilteringView) {
            NavigationStack {
                AssetsFilterScene(model: $model.filterModel)
            }
            .presentationDetents([.height(200)])
            .presentationDragIndicator(.visible)
        }
    }

    func addAsset(_ asset: Asset) {
        Task {
            try model.assetsService.addAsset(walletId: model.wallet.walletId, asset: asset)
        }
        dismiss()
    }
}