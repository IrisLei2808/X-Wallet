//
//  TokenContactCardView.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import SwiftUI

struct TokenContactCardView: View {
    
    let vm: TokenContact
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                vm.iconImage
                    .resizable()
                    .frame(width: 36, height: 36)
                CustomText(name: vm.name, textColor: Colors.blueWhite, alignment: .leading, font: Fonts.mediumFont14, maxWidth: false)
                CustomText(name: vm.obfuscatedAddress, textColor: Colors.blueWhite.opacity(0.7), alignment: .trailing, font: Fonts.regularFont14)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .background(Colors.brown8Brown5)
        .cornerRadius(20)
    }
}
