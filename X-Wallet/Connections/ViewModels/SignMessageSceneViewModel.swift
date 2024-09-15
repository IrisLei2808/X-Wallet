//
//  SignMessageSceneViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Keystore
import WalletConnector
import Primitives
import WalletCore

struct SignMessageSceneViewModel {
    private let keystore: any Keystore
    private let payload: SignMessagePayload
    private let confirmTransferDelegate: ConfirmTransferDelegate

    init(
        keystore: any Keystore,
        payload: SignMessagePayload,
        confirmTransferDelegate: @escaping ConfirmTransferDelegate
    ) {
        self.keystore = keystore
        self.payload = payload
        self.confirmTransferDelegate = confirmTransferDelegate
    }
    
    var networkText: String {
        return payload.chain.asset.name
    }
    
    var walletText: String {
        return payload.wallet.name
    }
    
    var message: String {
        return SignMessageDecoder(message: payload.message).preview
    }
    
    var buttonTitle: String {
        Localized.Transfer.confirm
    }
    
    func signMessage() throws {
        let message = SignMessage(type: payload.message.type, data: payload.message.data)
        let data = try keystore.sign(wallet: payload.wallet, message: message, chain: payload.chain)
        let result = SignMessageDecoder(message: message).getResult(from: data)
        confirmTransferDelegate(.success(result))
    }
}
