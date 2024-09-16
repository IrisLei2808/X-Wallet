//
//  BannerView.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import SwiftUI
import Primitives
import Components
import Style

struct BannerView: View {

    let banners: [Primitives.Banner]

    var closeAction: ((Banner) -> Void)

    var body: some View {
        ForEach(banners.map { BannerViewModel(banner: $0) }) { banner in
            HStack(spacing: 0) {
                ListItemView(title: banner.title, titleExtra: banner.description, image: banner.image, imageSize: 28, cornerRadius: 14)

                Spacer()

                if banner.canClose {
                    ListButton(
                        image: Image(systemName: SystemImage.xmarkCircle),
                        action: {
                            closeAction(banner.banner)
                        }
                    )
                    .padding(.vertical, Spacing.small)
                    .foregroundColor(Colors.gray)
                }
            }
        }
    }
}