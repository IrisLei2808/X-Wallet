//
//  NetworkDataService.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import Foundation
import Combine

class NetworkDataService {
    func getNetworks() -> AnyPublisher<[ChainNetwork], Error> {
        let dataSource = JSONReaderSource(fileName: "networks")
        return dataSource
            .get([ChainNetwork].self)
            .eraseToAnyPublisher()
    }
}
