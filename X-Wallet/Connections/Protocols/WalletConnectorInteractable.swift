//
//  WalletConnectorInteractable.swift
//  X-Wallet
//
//  Created by Duc Le on 9/14/24.
//

import Foundation
import WalletConnector
import Primitives

protocol WalletConnectorInteractable {
    func sessionReject(error: Error)
    func sessionApproval(payload: WalletConnectionSessionProposal) async throws -> Bool
    func signMessage(payload: SignMessagePayload) async throws -> String
    
    func signTransaction(transferData: TransferData) async throws -> String
    func sendTransaction(transferData: TransferData) async throws -> String
    func sendRawTransaction(transferData: TransferData) async throws -> String
}
