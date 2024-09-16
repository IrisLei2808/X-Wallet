//
//  SwapChangeView.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import SwiftUI

struct SwapChangeView: View {
    
    @Binding var fromId: String
    @Binding var toId: String
    
    var body: some View {
        Button {
            swap(&fromId, &toId)
        } label: {
            Image(.swapIcon)
        }
    }
}
