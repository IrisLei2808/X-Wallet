//
//  AddNetworkDataService.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import Foundation
import Combine

class AddNetworkDataService {
    
    func getNetworks() -> AnyPublisher<[AddNetwork], Error> {
        let dataSource = JSONReaderSource(fileName: "add-networks")
        return dataSource
            .get([AddNetwork].self)
            .eraseToAnyPublisher()
    }
}
