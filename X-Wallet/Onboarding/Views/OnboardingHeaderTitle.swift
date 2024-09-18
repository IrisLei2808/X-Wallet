//
//  OnboardingHeaderTitle.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import SwiftUI
import Style

struct OnboardingHeaderTitle: View {
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(Color("#818181"))
            .font(.system(size: 16, weight: .medium))
            .multilineTextAlignment(.center)
            .lineSpacing(Spacing.tiny)
            .lineLimit(2)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.top, Spacing.small)
    }
}
