//
//  ValidatorImageView.swift
//  X-Wallet
//
//  Created by Duc Le on 9/16/24.
//

import SwiftUI
import Components
import Primitives
import GemstonePrimitives

struct ValidatorImageView: View {
    
    let validator: DelegationValidator
    private let formatter = AssetImageFormatter()
    
    var body: some View {
        AsyncImageView(
            url: formatter.getValidatorUrl(chain: validator.chain, id: validator.id),
            placeholder: .letter(validator.name.first ?? " ")
        )
    }
}
