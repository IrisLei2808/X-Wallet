//
//  ConnectionsError.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation

enum ConnectionsError: LocalizedError {
    case userCancelled

    var errorDescription: String? {
        switch self {
        case .userCancelled: Localized.Errors.Connections.userCancelled
        }
    }
}
