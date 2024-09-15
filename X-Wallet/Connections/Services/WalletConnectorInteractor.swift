//
//  WalletConnectorInteractor.swift
//  X-Wallet
//
//  Created by Duc Le on 9/14/24.
//

import Foundation
import WalletConnector
import Primitives

struct WalletConnectorInteractor: WalletConnectorInteractable {
    func sessionApproval(payload: WalletConnectionSessionProposal) async throws -> Bool {
        return true
    }
    
    func signMessage(payload: SignMessagePayload) async throws -> String {
        return ""
    }
    
    func signTransaction(transferData: TransferData) async throws -> String {
        return ""
    }
    
    func sendTransaction(transferData: TransferData) throws -> String {
        return ""
    }
    
    func sendRawTransaction(transferData: TransferData) async throws -> String {
        return ""
    }
    
    func sessionReject(error: Error) {
        
    }
}
