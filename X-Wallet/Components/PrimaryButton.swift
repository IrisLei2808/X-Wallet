//
//  PrimaryButton.swift
//  X-Wallet
//
//  Created by Duc Le on 8/27/24.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var cornerRadius = CGFloat(12)
    var font: Font = Fonts.boldFont16
    var foregroundColor: Color = Colors.blue
    var backgroundColor: Color = Colors.brown
    var borderWidth: CGFloat?
    var maxHeight: CGFloat = 46
    var clicked: (() -> Void) /// use closure for callback
    var setGradient = true
    var body: some View {
        VStack {
            Button(action: clicked) {
                PrimaryButtonText(
                    text: text,
                    cornerRadius: cornerRadius,
                    font: font,
                    foregroundColor: foregroundColor,
                    backgroundColor: backgroundColor,
                    borderWidth: borderWidth,
                    maxHeight: maxHeight,
                    setGradient: setGradient)
            }
        }
    }
}

