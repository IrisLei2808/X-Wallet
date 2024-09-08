//
//  ChainNetwork.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import SwiftUI

struct ChainNetwork: Hashable, Codable {
    var id: String
    let name: String
    let imageName: String
}

extension ChainNetwork {
    var iconImage: Image {
        return Image(imageName)
    }
}
