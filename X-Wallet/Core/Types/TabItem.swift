//
//  TabItem.swift
//  X-Wallet
//
//  Created by Duc Le on 9/14/24.
//

import Foundation

enum TabItem: Identifiable {
    case wallet
    case activity
    case settings

    var id: Self { self }
}
