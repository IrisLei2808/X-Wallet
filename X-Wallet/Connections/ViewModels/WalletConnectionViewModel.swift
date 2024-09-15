//
//  WalletConnectionViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Primitives

struct WalletConnectionViewModel {
    let connection: WalletConnection
    
    var name: String {
        return connection.session.metadata.name
    }
    
    var imageUrl: URL? {
        return URL(string: connection.session.metadata.icon)
    }
    
    var host: String {
        return url?.host(percentEncoded: false) ?? .empty
    }
    
    var url: URL? {
        return URL(string: connection.session.metadata.url)
    }
}
