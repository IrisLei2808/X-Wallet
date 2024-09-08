//
//  UINavigationBarAppearance.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import SwiftUI

extension UINavigationBarAppearance {
    static func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        // Customize the title text color
        appearance.titleTextAttributes = [.foregroundColor: Colors.blueWhite.uiColor]
        // Customize the large title text color
        appearance.largeTitleTextAttributes = [.foregroundColor: Colors.blueWhite.uiColor]
        appearance.titleTextAttributes = [.foregroundColor: Colors.blueWhite.uiColor]
        
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        scrollEdgeAppearance.backgroundColor = Colors.brown8DarkBlue.uiColor
        scrollEdgeAppearance.configureWithOpaqueBackground()
        scrollEdgeAppearance.backgroundColor = Colors.brown8DarkBlue.uiColor
        UINavigationBar.appearance().standardAppearance = scrollEdgeAppearance
    }
}
