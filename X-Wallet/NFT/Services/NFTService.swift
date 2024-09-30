//
//  NFTService.swift
//  X-Wallet
//
//  Created by Duc Le on 9/28/24.
//

import Foundation
import Combine

enum APIEndpoint {
    case nftCollection
    
    var urlString: String {
        switch self {
        case .nftCollection:
            return "https://api.opensea.io/api/v2/collection/apes-bunitori-club/nfts"
        }
    }
}

class NFTService {    
    func fetchApesNFT() -> AnyPublisher<[NFT], APIError>{
        let endpoint = APIEndpoint.nftCollection
        return APIService.shared.fetch(urlString: endpoint.urlString)
            .map { (response: NFTData) in
                response.nfts
            }
            .eraseToAnyPublisher()
    }
}
