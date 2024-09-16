//
//  WordSuggestor.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation

struct WordSuggestor {
    func wordSuggestionCalculate(value: String) -> String? {
        if value.last != Character.space, let word = value.split(separator: " ").last {
            return String(word)
        }
        return .none
    }
    
    func selectWordCalculate(input: String, word: String) -> String {
        var words = input.split(separator: " ").map { String($0) }
        if !words.isEmpty {
            words = words.dropLast()
            words.append(word)
        }
        return words.joined(separator: " ") + " "
    }
}
