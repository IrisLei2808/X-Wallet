//
//  AddNodeError.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation

enum AddNodeError: LocalizedError {
    case invalidNetworkId
    case invalidURL
    
    var errorDescription: String? {
        switch self  {
        case .invalidURL: Localized.Errors.invalidUrl
        case .invalidNetworkId: Localized.Errors.invalidNetworkId
        }
    }
}
