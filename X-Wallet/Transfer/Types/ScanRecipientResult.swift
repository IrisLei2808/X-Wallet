//
//  ScanRecipientResult.swift
//  X-Wallet
//
//  Created by Duc Le on 9/14/24.
//

import Foundation

enum ScanRecipientResult {
    case address(address: String, memo: String?)
    case transfer(TransferData)
}
