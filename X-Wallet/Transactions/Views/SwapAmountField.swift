//
//  SwapAmountField.swift
//  X-Wallet
//
//  Created by Duc Le on 9/14/24.
//

import Foundation
import SwiftUI
import Style
import Components

public struct SwapAmountField {
    public let assetImage: AssetImage
    public let amount: String
    public let fiatAmount: String?
    
    public init(assetImage: AssetImage, amount: String, fiatAmount: String?) {
        self.assetImage = assetImage
        self.amount = amount
        self.fiatAmount = fiatAmount
    }
}

public struct SwapAmountView: View {
    
    public let from: SwapAmountField
    public let to: SwapAmountField
    
    public init(
        from: SwapAmountField,
        to: SwapAmountField
    ) {
        self.from = from
        self.to = to
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            SwapAmountSingleView(field: from)
            Image(.arrowDown)
                .resizable()
                .colorMultiply(.black)
                .frame(width: 18, height: 22)
                .scaledToFit()
                .padding(.bottom, 8)
                .offset(y: -8)
            SwapAmountSingleView(field: to)
        }
    }
}

public struct SwapAmountSingleView: View {
    
    let field: SwapAmountField
    
    public var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading) {
                Text(field.amount)
                    .foregroundColor(.black)
                    .font(.system(size: 24))
                    .scaledToFit()
                    .fontWeight(.medium)
                    .minimumScaleFactor(0.4)
                    .truncationMode(.tail)
                    .lineLimit(1)
                if let fiatAmount = field.fiatAmount {
                    Text(fiatAmount)
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundColor(Color.gray)
                }
            }
            Spacer(minLength: 60)
            AssetImageView(assetImage: field.assetImage)
        }
    }
}
