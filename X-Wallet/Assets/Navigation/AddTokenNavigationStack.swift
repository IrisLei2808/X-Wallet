//
//  AddTokenNavigationStack.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import SwiftUI
import Primitives

struct AddTokenNavigationStack: View {
    
    let wallet: Wallet
    @State var isPresenting: Binding<Bool>
    var action: ((Asset) -> Void)?
    
    @Environment(\.chainServiceFactory) private var chainServiceFactory

    var body: some View {
        NavigationStack {
            AddTokenScene(
                model: AddTokenViewModel(
                    wallet: wallet,
                    service: AddTokenService(chainServiceFactory: chainServiceFactory)
                ),
                action: action
            )
            .navigationTitle(Localized.Settings.Networks.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(Localized.Common.cancel) {
                        isPresenting.wrappedValue = false
                    }
                }
            }
        }
    }
}
