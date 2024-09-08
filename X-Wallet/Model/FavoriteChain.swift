//
//  FavoriteChain.swift
//  X-Wallet
//
//  Created by Duc Le on 8/26/24.
//

import SwiftUI

struct FavoriteChain: Identifiable, Codable {
    let id: String
    let name: String
    let imageName: String
    var isFavorite: Bool
}

extension FavoriteChain {
    var iconImage: Image {
        Image(imageName)
    }
    
    var favoriteIndicatorImage: Image {
        isFavorite ? Image("star-fill") : Image("star")
    }
    
    func toggleFavorite() -> FavoriteChain {
        return FavoriteChain(id: id, name: name, imageName: imageName, isFavorite: !isFavorite)
    }
}
