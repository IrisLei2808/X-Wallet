//
//  HeaderButtonsView.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import SwiftUI
import Components

typealias HeaderButtonAction = ((HeaderButtonType) -> Void)

struct HeaderButtonsView: View {
    let buttons: [HeaderButton]
    var action: HeaderButtonAction?
    
    var maxWidth: CGFloat {
        buttons.count > 3 ? 84 : 94
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            ForEach(buttons) { button in
                RoundButton(title: button.title, image: button.image) {
                    action?(button.type)
                }
                .accessibilityIdentifier(button.id)
                .frame(maxWidth: maxWidth, alignment: .center)
            }
        }
    }
}
