//
//  ImportWalletNavigationStack.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import SwiftUI
import Primitives

struct ImportWalletNavigationStack: View {
    
    @State var isPresenting: Binding<Bool>
    
    @Environment(\.keystore) private var keystore
    
    var body: some View {
        NavigationStack {
            ImportWalletTypeScene(model: ImportWalletTypeViewModel(keystore: keystore))
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(Localized.Common.cancel) {
                            isPresenting.wrappedValue.toggle()
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: ImportWalletType.self) { type in
                    ImportWalletScene(
                        model: ImportWalletViewModel(type: type, keystore: keystore)
                    )
                }
        }
    }
}
