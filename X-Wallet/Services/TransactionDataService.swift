//
//  TransactionDataService.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import Foundation
import Combine

class TransactionDataService {
    func getTransactions() -> AnyPublisher<[Transaction], Error> {
        let dataSource = JSONReaderSource(fileName: "transactions")
        return dataSource
            .get([Transaction].self)
            .eraseToAnyPublisher()
    }
}
