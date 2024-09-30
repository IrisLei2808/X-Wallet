//
//  NFTNavigationStack.swift
//  X-Wallet
//
//  Created by Duc Le on 9/27/24.
//

import SwiftUI
import ProximityReader

struct NFTNavigationStack: View {
    
    @State private var isNFTPresented: Bool = false
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            
        }
    }
}

