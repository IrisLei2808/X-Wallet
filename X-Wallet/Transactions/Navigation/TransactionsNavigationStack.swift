//
//  TransactionsNavigationStack.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import SwiftUI
import Primitives

struct TransactionsNavigationStack: View {
    
    let model: TransactionsViewModel
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            TransactionsScene(model: model)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
