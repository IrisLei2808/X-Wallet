//
//  TokenContact.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import Foundation
import SwiftUI

struct TokenContact: Hashable, Codable {
    let id: String
    
    let name: String
    
    let imageName: String
    
    let address: String
}

extension TokenContact {
    var iconImage: Image {
        Image(imageName)
    }
    
    var obfuscatedAddress: String {
        [String(address.prefix(5)), String(address.suffix(3))].joined(separator: "...")
    }
}
