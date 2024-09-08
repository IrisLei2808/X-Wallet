//
//  BackgroundGradientView.swift
//  X-Wallet
//
//  Created by Duc Le on 8/27/24.
//

import SwiftUI

struct BackgroundGradientView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .top) {
            if colorScheme == .dark {
                Image("backgroundImage")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            } else {
                Rectangle()
                    .fill(.white)
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .ignoresSafeArea()
    }
}
