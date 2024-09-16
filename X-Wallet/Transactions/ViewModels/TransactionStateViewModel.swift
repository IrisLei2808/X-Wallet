//
//  TransactionStateViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Primitives
import Style
import SwiftUI

struct TransactionStateViewModel {
    
    let state: TransactionState
    
    var title: String {
        switch state {
        case .confirmed:
            return Localized.Transaction.Status.confirmed
        case .pending:
            return Localized.Transaction.Status.pending
        case .failed:
            return Localized.Transaction.Status.failed
        case .reverted:
            return Localized.Transaction.Status.failed
        }
    }
    
    var color: Color {
        switch state {
        case .confirmed: Color.gray
        case .pending: Color.orange
        case .failed, .reverted: Colors.red
        }
    }
    
    var background: Color {
        switch state {
        case .confirmed: Color.gray
        case .pending: Color.orange.opacity(0.15)
        case .failed, .reverted: Colors.red.opacity(0.15)
        }
    }
}
