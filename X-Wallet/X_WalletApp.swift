//
//  X_WalletApp.swift
//  X-Wallet
//
//  Created by Duc Le on 8/26/24.
//

import SwiftUI
import IQKeyboardManagerSwift

@main
struct XWalletApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @ObservedObject private var themeManager = SystemThemeManager()
    @StateObject private var data = XWalletData()
    var body: some Scene {
        WindowGroup {
            SessionView()
                .environmentObject(data)
                .preferredColorScheme(themeManager.selectedTheme)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        IQKeyboardManager.shared.enable = true
        return true
    }
}
