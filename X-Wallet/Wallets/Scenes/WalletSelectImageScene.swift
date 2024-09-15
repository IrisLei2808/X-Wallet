//
//  WalletSelectImageScene.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import SwiftUI

struct WalletSelectImageScene: View {
    
    let model: WalletSelectImageViewModel

    init(model: WalletSelectImageViewModel) {
        self.model = model
    }

    var body: some View {
        Text(model.wallet.name)
    }
}
