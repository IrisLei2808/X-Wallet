//
//  SelectNetworkCardView.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import SwiftUI

struct SelectNetworkCardView: View{
    let networkItem: ChainNetwork
    
    var body: some View {
        HStack (alignment: .center, spacing: 12.0) {
            networkItem.iconImage
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            CustomText(name: networkItem.name, textColor: Colors.blueWhite,
                       font: Fonts.mediumFont14)
        }
    }
}
