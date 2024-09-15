//
//  ShowPrivateKeyViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Primitives

struct ShowPrivateKeyViewModel {

    let text: String
    let encoding: EncodingType

    init(text: String, encoding: EncodingType) {
        self.text = text
        self.encoding = encoding
    }
}

extension ShowPrivateKeyViewModel: SecretPhraseViewableModel {
    var title: String {
        return Localized.Common.privateKey
    }

    var presentWarning: Bool {
        return true
    }

    var type: SecretPhraseDataType {
        .privateKey(key: text)
    }

    var copyValue: String {
        text
    }

    var copyType: CopyType {
        .privateKey
    }
}
