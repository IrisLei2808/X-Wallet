//
//  DeepLink.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import Foundation

struct DeepLink {
    private init() {}
    
    static let shared = DeepLink()
    
    let scheme = "crypto"
    
    let host = "chains"
    
    func url(for chain: String) -> URL {
        return  URL(string: "\(scheme)://\(host)/\(chain)")!
    }
    
    func getCode(from url: URL) -> String? {
        guard url.scheme == scheme,
              url.host() == host,
              url.pathComponents.count >= 2 else {
            return nil
        }
        
        return url.pathComponents[1]
    }
}
