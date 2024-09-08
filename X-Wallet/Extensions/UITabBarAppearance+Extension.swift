//
//  UITabBarAppearance+Extension.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import SwiftUI

extension UITabBarAppearance {
    static func configureTabBar() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = Colors.whiteDarkBlue.uiColor
        let titleTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: Colors.brown0Brown.uiColor
        ]
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = titleTextAttributes
        let titleTextAttributes1: [NSAttributedString.Key: Any] = [
            .foregroundColor: Colors.brown0White.uiColor,
            .font: UIFont.systemFont(ofSize: 14.0, weight: .bold)
        ]
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = titleTextAttributes1
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = Colors.brown0White.uiColor
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = Colors.brown0Brown.uiColor
        tabBarAppearance.shadowColor = .clear
        tabBarAppearance.shadowImage = UIImage()
        tabBarAppearance.backgroundImage = UIImage()
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
}
