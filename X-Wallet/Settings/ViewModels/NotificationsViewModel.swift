//
//  NotificationsViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import UserNotifications
import UIKit
import Store

struct NotificationsViewModel {
    
    let deviceService: DeviceService
    let subscriptionService: SubscriptionService
    let preferences = Preferences()
    
    var isPushNotificationsEnabled: Bool {
        preferences.isPushNotificationsEnabled
    }
    
    var title: String {
        return Localized.Settings.Notifications.title
    }
    
    func update() async throws {
        try await deviceService.update()
    }
    
    func requestPermissions() async throws -> Bool {
        try await deviceService.requestPermissions()
    }
}
