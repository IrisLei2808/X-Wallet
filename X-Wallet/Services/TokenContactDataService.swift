//
//  TokenContactDataService.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import Foundation
import Combine

class TokenContactDataService {
    func getContacts() -> AnyPublisher<[TokenContact], Error> {
        let dataSource = JSONReaderSource(fileName: "token-contacts")
        return dataSource
            .get([TokenContact].self)
            .eraseToAnyPublisher()
    }
}
