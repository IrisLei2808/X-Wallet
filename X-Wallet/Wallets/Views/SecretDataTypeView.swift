//
//  SecretDataTypeView.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import SwiftUI
import Style

struct SecretDataTypeView: View {
    let type: SecretPhraseDataType

    var body: some View {
        switch type {
        case .words(let rows):
            SecretPhraseGridView(rows: rows)
                .padding(.top, Spacing.scene.top)
        case .privateKey(let key):
            Text(key)
                .padding(.top, Spacing.scene.top)
        }
    }
}
