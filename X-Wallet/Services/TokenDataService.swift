//
//  TokenDataService.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import Foundation
import Combine

class TokenDataService {
    func getTokens() -> AnyPublisher<[Chain], Error> {
        let dataSource = JSONReaderSource(fileName: "tokens")
        return dataSource
            .get([Chain].self)
            .eraseToAnyPublisher()
    }
}
