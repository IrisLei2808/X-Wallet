//
//  NFTViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/28/24.
//

import Foundation
import Combine

class NFTViewModel: ObservableObject {
    @Published var apesNft: [NFT] = []
    @Published var errorMessage: String?
    private var cancellables = Set<AnyCancellable>()
    private var nftService = NFTService()
    
    func loadApesNft() {
        nftService.fetchApesNFT()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { nfts in
                self.apesNft = nfts
            })
            .store(in: &cancellables)
    }
}
