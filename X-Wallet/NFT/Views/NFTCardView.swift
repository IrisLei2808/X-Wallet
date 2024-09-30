//
//  NFTCardView.swift
//  X-Wallet
//
//  Created by Duc Le on 9/28/24.
//

import SwiftUI

struct NFTCardView: View {
    @StateObject var nftViewModel = NFTViewModel()
    let padding: CGFloat = 10
    
    var body: some View {
        List(nftViewModel.apesNft, id: \.identifier) { nft in
            Text(nft.name)
            Text(nft.description)
        }
        .onAppear {
            nftViewModel.loadApesNft()
        }
        .alert(isPresented: Binding<Bool>(
                    get: { nftViewModel.errorMessage != nil },
                    set: { if !$0 { nftViewModel.errorMessage = nil } }
                )) {
                    Alert(title: Text("Error"), message: Text(nftViewModel.errorMessage ?? ""), dismissButton: .default(Text("OK")))
                }
    }
}
