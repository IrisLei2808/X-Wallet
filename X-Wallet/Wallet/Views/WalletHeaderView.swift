//
//  WalletHeaderView.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import SwiftUI
import Store
import Style
import Components
import GemstonePrimitives

protocol HeaderViewModel {
    var isWatchWallet: Bool { get }
    var assetImage: AssetImage? { get }
    var title: String { get }
    var subtitle: String? { get }
    var buttons: [HeaderButton] { get }
}

struct WalletHeaderView: View {
    
    let model: HeaderViewModel
    var action: HeaderButtonAction?
    
    var body: some View {
        VStack(spacing: Spacing.large/2) {
            if let assetImage = model.assetImage {
                AssetImageView(
                    assetImage: assetImage,
                    size: 64,
                    overlayImageSize: 26
                )
            }
            
            Text(model.title)
                .minimumScaleFactor(0.5)
                .font(.system(size: 42))
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .lineLimit(1)
                
            if let subtitle = model.subtitle {
                Text(subtitle)
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
            }
            
            switch model.isWatchWallet {
            case true:
                HStack {
                    Image(systemName: SystemImage.eye)
                    
                    Text(Localized.Wallet.Watch.Tooltip.title)
                        .foregroundColor(.black)
                        .font(.callout)
                    
                    Button {
                        UIApplication.shared.open(Docs.url(.whatIsWatchWallet))
                    } label: {
                        Image(systemName: SystemImage.info)
                            .tint(.black)
                    }
                }
                .padding()
                .background(Color.gray)
                .cornerRadius(Spacing.medium)
                .padding(.top, Spacing.medium)
            case false:
                HeaderButtonsView(buttons: model.buttons, action: action)
                    .padding(.top, Spacing.small)
            }
        }
    }
}
