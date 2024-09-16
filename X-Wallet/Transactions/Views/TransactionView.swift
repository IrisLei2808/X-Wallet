//
//  TransactionView.swift
//  X-Wallet
//
//  Created by Duc Le on 9/16/24.
//

import SwiftUI
import Components
import Primitives
import Style

struct TransactionView: View {
    let model: TransactionViewModel

    init(model: TransactionViewModel) {
        self.model = model
    }

    var body: some View {
        HStack {
            AssetImageView(assetImage: model.assetImage)
            ListItemView(
                title: model.title,
                titleStyle: model.titleTextStyle,
                titleTag: model.titleTag,
                titleTagStyle: model.titleTagStyle,
                titleTagType: model.titleTagType,
                titleExtra: model.titleExtra,
                titleStyleExtra: model.titleTextStyleExtra,
                subtitle: model.subtitle,
                subtitleStyle: model.subtitleTextStyle,
                subtitleExtra: model.subtitleExtra,
                subtitleStyleExtra: model.subtitleExtraStyle
            )
        }
        .contextMenu {
            ContextMenuViewURL(title: model.viewOnTransactionExplorerText, url: model.transactionExplorerUrl, image: SystemImage.globe)
        }
    }
}
