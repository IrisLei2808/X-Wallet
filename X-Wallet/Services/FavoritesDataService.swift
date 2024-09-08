//
//  FavoritesDataService.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import Foundation
import Combine

class FavoritesDataService {
    func getFavorites() -> AnyPublisher<[FavoriteChain], Error> {
        let dataSource = JSONReaderSource(fileName: "favorites")
        return dataSource
            .get([FavoriteChain].self)
            .eraseToAnyPublisher()
    }
}
