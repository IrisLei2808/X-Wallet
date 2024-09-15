//
//  SecretPhraseViewableModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation

protocol SecretPhraseViewableModel {
    var title: String { get }
    var type: SecretPhraseDataType { get }
    var copyValue: String { get }
    var copyType: CopyType { get }
    var presentWarning: Bool { get }
}
