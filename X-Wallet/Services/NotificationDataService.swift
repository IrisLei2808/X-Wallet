//
//  NotificationDataService.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import Foundation
import Combine

class NotificationDataService {
    func getNotifications() -> AnyPublisher<[Notification], Error> {
        let dataSource = JSONReaderSource(fileName: "notifications")
        return dataSource
            .get([Notification].self)
            .eraseToAnyPublisher()
    }
}
