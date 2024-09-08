//
//  Int+Extension.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import Foundation

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    
    var string: String {
        return String(self)
    }
}
