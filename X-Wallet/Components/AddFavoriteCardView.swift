//
//  AddFavoriteCardView.swift
//  X-Wallet
//
//  Created by Duc Le on 8/26/24.
//

import SwiftUI

struct AddFavoriteCardView: View {
    
    let vm: FavoriteChain
    let onToggle: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center) {
                vm.iconImage
                    .resizable()
                    .frame(width: 36, height: 36)
                
                CustomText(name: vm.name, textColor: Colors.blueWhite, alignment: .leading, font: Fonts.mediumFont14, maxWidth: false)
                
                Spacer()
                
                vm.favoriteIndicatorImage
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(Colors.brown)
                    .onTapGesture {
                        onToggle()
                    }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .background(Colors.brown8Brown5)
        .cornerRadius(20)
    }
}

