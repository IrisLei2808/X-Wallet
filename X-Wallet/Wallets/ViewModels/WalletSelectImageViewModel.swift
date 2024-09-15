//
//  WalletSelectImageViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Primitives
import SwiftUI

class WalletSelectImageViewModel {

    @Binding var navigationPath: NavigationPath
    let wallet: Wallet

    init(
        navigationPath: Binding<NavigationPath>,
        wallet: Wallet
    ) {
        _navigationPath = navigationPath
        self.wallet = wallet
    }
}
