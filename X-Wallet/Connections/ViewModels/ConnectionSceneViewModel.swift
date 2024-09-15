//
//  ConnectionSceneViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation

struct ConnectionSceneViewModel {
    let model: WalletConnectionViewModel
    let service: ConnectionsService
    
    var title: String {
        Localized.WalletConnect.Connection.title
    }
    
    var walletField: String { Localized.Common.wallet }
    var walletText: String { model.connection.wallet.name }
    
    var dateField: String { Localized.Transaction.date }
    var dateText: String {
        return TransactionDateFormatter(date: model.connection.session.createdAt).row
    }

    func disconnect() async throws {
        let sessionId = model.connection.session.sessionId
        let pairingId = model.connection.session.id
        if sessionId == pairingId {
            try await service.disconnectPairing(pairingId: pairingId)
        } else {
            try await service.disconnect(sessionId: sessionId)
            try await service.disconnectPairing(pairingId: pairingId)
        }
    }
}
