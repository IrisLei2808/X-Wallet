//
//  StakeValidatorViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import Primitives

struct StakeValidatorViewModel {
    let validator: DelegationValidator
    
    let aprFormatter = CurrencyFormatter(type: .percentSignLess)
    
    var name: String {
        validator.name
    }
    
    var aprText: String {
        if validator.apr > 0 {
            return Localized.Stake.apr(aprFormatter.string(validator.apr))
        }
        return .empty
    }
}
