//
//  TextWithImage.swift
//  X-Wallet
//
//  Created by Duc Le on 8/27/24.
//

import SwiftUI

struct TextWithImage: View {
    var todayChangedAmount: String
    var todayChangedPercentage: String
    var textBackgroundColor: Color
    var textForegroundColor: Color
    var font: Font = Fonts.mediumFont14
    var image: Image?
    var imageForegroundColor: Color = Colors.brown
    var verticalPadding: Double = 4
    var cornerRadius: Double = 18
    var body: some View {
        HStack(spacing: 12) {
            HStack(spacing: 2) {
                if let image = image {
                    image
                        .foregroundColor(imageForegroundColor)
                }
                CustomText(name: todayChangedAmount, textColor: textForegroundColor, alignment: .center, font: font, maxWidth: false)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, verticalPadding)
            .background(textBackgroundColor)
            .cornerRadius(cornerRadius)
            if(todayChangedPercentage != "") {
                CustomText(name: todayChangedPercentage, textColor: Colors.green, alignment: .center, font: Fonts.boldFont14, maxWidth: false)
            }
        }
    }
}

