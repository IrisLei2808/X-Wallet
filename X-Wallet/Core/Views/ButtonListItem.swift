//
//  ButtonListItem.swift
//  X-Wallet
//
//  Created by Duc Le on 9/14/24.
//

import Foundation
import SwiftUI

struct ButtonListItem: View {
    
    let title: String
    let image: Image
    let action: () -> Void
    
    var body: some View {
        Button(role: .none, action: action) {
            HStack {
                image
                Text(title)
            }
        }
    }
}
