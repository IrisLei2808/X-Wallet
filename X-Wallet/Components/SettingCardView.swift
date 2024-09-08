//
//  SettingCardView.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import SwiftUI

struct SettingCardView: View {
    let vm: ChainViewModel
    let action: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                vm.image
                    .resizable()
                    .frame(width: 36, height: 36)
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        CustomText(name: vm.name, textColor: Colors.blueWhite, alignment: .leading, font: Fonts.regularFont16, maxWidth: true)
                    }
                    HStack {
                        CustomText(name: "0x000...000", textColor: Colors.blue70White70, alignment: .leading, font: Fonts.regularFont14, maxWidth: false)
                            .layoutPriority(1)
                    }
                }
                if let action = action {
                    Button {
                        action()
                    } label: {
                        Image("settingCopy")
                            .foregroundColor(Colors.blueWhite)
                    }
                }else {
                    Image("settingCopy")
                        .foregroundColor(Colors.blueWhite)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(Colors.brown8Brown5)
        .cornerRadius(20)
    }
}


