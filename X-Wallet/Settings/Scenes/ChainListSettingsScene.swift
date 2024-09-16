//
//  ChainListSettingsScene.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import SwiftUI
import Primitives
import Components
import Style

struct ChainListSettingsScene: View {
    @Environment(\.nodeService) private var nodeService
    @Environment(\.explorerService) private var explorerService

    let model = ChainListSettingsViewModel()

    var body: some View {
        SearchableListView(
            items: model.chains,
            filter: model.filter(_:query:),
            content: { chain in
                NavigationLink(value: chain) {
                    ChainView(chain: chain)
                }
            },
            emptyContent: {
                StateEmptyView(
                    title: Localized.Common.noResultsFound,
                    image: Image(systemName: SystemImage.searchNoResults)
                )
            }
        )
        .navigationDestination(for: Chain.self) { chain in
            ChainSettingsScene(
                model: ChainSettingsViewModel(nodeService: nodeService, explorerService: explorerService, chain: chain)
            )
        }
        .navigationTitle(model.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: -

struct ChainView: View {
    let chain: Chain

    var body: some View {
        ListItemView(
            title: Asset(chain).name,
            image: Image(chain.id),
            imageSize: Sizing.image.chain,
            cornerRadius: Sizing.image.chain/2
        )
    }
}
