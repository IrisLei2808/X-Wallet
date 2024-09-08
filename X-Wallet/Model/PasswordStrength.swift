//
//  PasswordStrength.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import SwiftUI

enum PasswordStrength: String {
    case weak = "Weak"
    case fair = "Fair"
    case good = "Good"
    case strong = "Strong"
}

extension PasswordStrength {
    var title: String {
        let strings = LocalizableString()
        switch self {
        case .weak:
            return strings.weak
        case .fair:
            return strings.fair
        case .good:
            return strings.good
        case .strong:
            return strings.strong
        }
    }
    
    var tintColor: Color {
        switch self {
        case .weak:
            return Colors.red.opacity(0.7)
        case .fair:
            return Colors.brown.opacity(0.7)
        case .good:
            return Colors.blue.opacity(0.7)
        case .strong:
            return Colors.green.opacity(0.7)
        }
    }
}
