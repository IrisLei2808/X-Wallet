//
//  SessionView.swift
//  X-Wallet
//
//  Created by Duc Le on 8/26/24.
//

import SwiftUI

struct SessionView: View {
    @EnvironmentObject var data: XWalletData
    
    var body: some View {
        ZStack {
            switch data.sessionState {
            case .loggedIn:
                TabbarView()
                    .transition(.opacity)
            case .loggedOut:
                SplashStackView()
                    .transition(.opacity)
            }
        }
        .animation(.linear(duration: 0.3), value: data.sessionState)
        .onAppear() {
            data.sessionState = LocalStorage.shared.isUserLoggedIn == true ? .loggedIn :  .loggedOut
        }
    }
}

#Preview {
    SessionView()
}
