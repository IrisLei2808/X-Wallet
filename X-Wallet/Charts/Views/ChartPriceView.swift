//
//  ChartPriceView.swift
//  X-Wallet
//
//  Created by Duc Le on 9/16/24.
//

import SwiftUI
import Style

struct ChartPriceView: View {
    
    let date: String?
    let price: String
    let priceChange: String?
    let priceChangeTextColor: Color
    
    var body: some View {
        VStack(spacing: Spacing.tiny) {
            HStack(alignment: .center, spacing: Spacing.tiny) {
                Text(price)
                    .font(.title2)
                    .foregroundColor(.black)
                
                if let priceChange {
                    Text(priceChange)
                        .font(.callout)
                        .foregroundColor(priceChangeTextColor)
                }
            }
            
            HStack {
                if let date {
                    Text(date)
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                }
            }.frame(height: 16)
        }
    }
}
