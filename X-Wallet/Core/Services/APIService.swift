//
//  APIService.swift
//  X-Wallet
//
//  Created by Duc Le on 9/28/24.
//

import Foundation
import Combine

enum APIError: Error {
    case invalidURL
    case noData
    case decodingError(Error)
}

class APIService {
    static let shared = APIService()
    private init() {}
    private let apiKey: String = "8508b543dab44d2d8e3345807c7d0395"
    
    func fetch<T: Decodable>(urlString: String) -> AnyPublisher<T, APIError> {
        guard let url = URL(string: urlString) else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("YOUR_API_KEY", forHTTPHeaderField: "X-API-Key")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .tryMap { data in
                if data.isEmpty {
                    throw APIError.noData
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                error is URLError ? APIError.noData : APIError.decodingError(error)
            }
            .eraseToAnyPublisher()
    }
}
