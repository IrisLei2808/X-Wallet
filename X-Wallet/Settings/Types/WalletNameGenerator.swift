//
//  WalletNameGenerator.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Keystore
import Primitives

struct WalletNameGenerator {
    
    let type: ImportWalletType
    let keystore: any Keystore
    
    var name: String {
        let index = (try? keystore.getNextWalletIndex()) ?? 0
        return name(type: type, index: index)
    }
    
    func name(type: ImportWalletType, index: Int) -> String {
        switch type {
        case .multicoin: Localized.Wallet.defaultName(index)
        case .chain(let chain): Localized.Wallet.defaultNameChain(Asset(chain).name, index)
        }
    }
}

extension ImportWalletType {
    var type: WalletType {
        switch self {
        case .multicoin: .multicoin
        case .chain: .single
        }
    }
}
