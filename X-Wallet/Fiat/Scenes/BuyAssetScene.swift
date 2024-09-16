//
//  BuyAssetScene.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import SwiftUI
import Primitives
import Style
import Components

struct BuyAssetScene: View {
    @State private var model: BuyAssetViewModel
    @FocusState private var focusedField: BuyAssetInputField.FiatField?

    init(model: BuyAssetViewModel) {
        _model = State(initialValue: model)
    }

    var body: some View {
        VStack {
            List {
                amountInputView
                amountSelectorSection
                providerSection
            }
            Spacer()
            StateButton(
                text: model.actionButtonTitle,
                viewState: model.state,
                action: onSelectContinue
            )
            .frame(maxWidth: Spacing.scene.button.maxWidth)
        }
        .listStyle(.insetGrouped)
        .padding(.bottom, Spacing.scene.bottom)
        .background(Colors.grayBackground)
        .frame(maxWidth: .infinity)
        .navigationTitle(model.title)
        .debounce(
            value: $model.input.amount,
            interval: .none,
            action: onChangeAmount
        )
        .task {
            await onTask()
        }
        .onAppear {
            UITextField.appearance().clearButtonMode = .never
            focusedField = .fiat
        }
        .onChange(of: model.input.amount) { _, _ in
            focusedField = .fiat
        }
        .navigationDestination(for: Scenes.FiatProviders.self) { _ in
            FiatProvidersScene(
                model: FiatProvidersViewModel(
                    asset: model.asset,
                    quotes: model.state.value ?? [],
                    selectQuote: onSelectQuote(_:)
                )
            )
        }
    }
}

// MARK: - UI Components

extension BuyAssetScene {
    private var amountInputView: some View {
        VStack(alignment: .center, spacing: 0) {
            BuyAssetInputField(
                text: $model.amountText,
                currencySymbol: model.currencySymbol,
                focusedField: $focusedField
            )
            Text(model.cryptoAmountValue)
                .textStyle(.calloutSecondary.weight(.medium))
                .frame(minHeight: Sizing.list.image)
        }
        .frame(maxWidth: .infinity)
        .background(Colors.grayBackground)
        .listRowInsets(EdgeInsets())
    }

    private var amountSelectorSection: some View {
        Section {
            HStack(spacing: Spacing.small) {
                AssetImageView(assetImage: model.assetImage)

                Text(model.asset.symbol)
                    .textStyle(.headline.weight(.semibold))

                Spacer()

                HStack(spacing: Spacing.medium) {
                    ForEach(model.suggestedAmounts, id: \.self) { amount in
                        Button(model.buttonTitle(amount: amount)) {
                            onSelect(amount: amount)
                        }
                        .font(.subheadline.weight(.semibold))
                        .foregroundStyle(Colors.black)
                        .padding(.all, Spacing.small)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(Colors.grayVeryLight)
                        )
                        .buttonStyle(.plain)
                    }

                    Button(Emoji.random) {
                        onSelect(amount: model.randomAmount)
                    }
                    .buttonStyle(.plain)
                    .font(.title.weight(.semibold))
                    .padding(.all, Spacing.tiny)
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(hex: "#2A32FF"),
                                        Color(hex: "#6CB8FF"),
                                        Color(hex: "#F213F6"),
                                        Color(hex: "FFF963")
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 3
                            )
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var providerSection: some View {
        Section {
            switch model.state {
            case .noData:
                StateEmptyView(title: model.emptyTitle)
            case .loading:
                ListItemLoadingView()
                    .id(UUID())
            case .loaded(let quotes):
                if let quote = model.input.quote {
                    if quotes.count > 1 {
                        NavigationLink(value: Scenes.FiatProviders()) {
                            ListItemView(title: model.providerTitle, subtitle: quote.provider.name)
                        }
                    } else {
                        ListItemView(title: model.providerTitle, subtitle: quote.provider.name)
                    }
                    ListItemView(title: model.rateTitle, subtitle: model.rateValue(for: quote))
                } else {
                    EmptyView()
                }
            case .error(let error):
                ListItemErrorView(errorTitle: model.errorTitle, error: error)
            }
        }
    }
}

// MARK: - Actions

extension BuyAssetScene {
    private func onTask() async {
        guard model.input.quote == nil else { return }
        await model.fetch()
    }

    private func onSelectContinue() {
        guard let quote = model.input.quote,
              let url = URL(string: quote.redirectUrl) else { return }

        // TODO: - use new @Environment(\.openURL) var openURL, insead use UIKit UIApplication
        // currently impossible to use due navigation issues in nav stack
        UIApplication.shared.open(url, options: [:])
    }

    private func onSelect(amount: Double?) {
        guard let amount = amount else { return }
        model.input.amount = amount
    }

    private func onSelectQuote(_ quote: FiatQuote) {
        model.input.quote = quote
    }

    private func onChangeAmount(_ amount: Double) async {
        await model.fetch()
    }
}