//
//  ConnectionsViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Primitives

struct ConnectionsViewModel {
    let service: ConnectionsService
    
    func addConnectionURI(uri: String, wallet: Wallet) async throws {
        try await service.addConnectionURI(uri: uri, wallet: wallet)
    }
}
