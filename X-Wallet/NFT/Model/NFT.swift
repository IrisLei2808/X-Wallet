//
//  NFT.swift
//  X-Wallet
//
//  Created by Duc Le on 9/28/24.
//

import Foundation

struct NFTData: Codable {
    let nfts: [NFT]
    let next: String
}

struct NFT: Codable {
    let identifier, collection, contract, tokenStandard: String
    let name, description: String
    let imageURL, displayImageURL: String
    let displayAnimationURL: String?
    let metadataURL, openseaURL: String
    let updatedAt: String
    let isDisabled, isNsfw: Bool
    
    enum CodingKeys: String, CodingKey {
        case identifier, collection, contract
        case tokenStandard = "token_standard"
        case name, description
        case imageURL = "image_url"
        case displayImageURL = "display_image_url"
        case displayAnimationURL = "display_animation_url"
        case metadataURL = "metadata_url"
        case openseaURL = "opensea_url"
        case updatedAt = "updated_at"
        case isDisabled = "is_disabled"
        case isNsfw = "is_nsfw"
    }
}
