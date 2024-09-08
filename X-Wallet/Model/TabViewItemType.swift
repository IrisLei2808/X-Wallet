//
//  TabViewItemType.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import SwiftUI

enum TabViewItemType: String {
    case home     = "home"
    case wallet   = "wallet"
    case market   = "market"
    case settings = "setting"
}

extension TabViewItemType {
    var image: Image {
        switch self {
        case .home:     return Image("home.fill")
        case .wallet:   return Image("wallet.fill")
        case .market:   return Image("stat.fill")
        case .settings: return Image("setting.fill")
        }
    }
    
    var selectedImage: Image {
        switch self {
        case .home:     return Image("home.fill")
        case .market:   return Image("stat.fill")
        case .wallet:   return Image("wallet.fill")
        case .settings: return Image("setting.fill")
        }
    }
    
    var navigationTitle: String {
        switch self {
        case .home: return  LocalizableString().dashboard
        default:    return self.rawValue.capitalizeFirstLetter
        }
    }
}
