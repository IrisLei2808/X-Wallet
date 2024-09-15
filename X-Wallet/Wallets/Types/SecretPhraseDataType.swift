//
//  SecretPhraseDataType.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation

enum SecretPhraseDataType {
    case words(words: [[WordIndex]])
    case privateKey(key: String)
}
