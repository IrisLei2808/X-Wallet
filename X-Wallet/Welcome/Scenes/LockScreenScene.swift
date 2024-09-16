//
//  LockScreenScene.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import SwiftUI
import Style

struct LockScreenScene: View {
    
    @ObservedObject var lockStateService: LockStateService
    
    var body: some View {
        VStack {
            Spacer()
            VStack() {
                Image(.logo)
                    .resizable()
                    .frame(width: 128, height: 128)
                    .scaledToFit()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Colors.whiteDarkBlue)
    }
}
