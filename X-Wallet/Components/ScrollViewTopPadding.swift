//
//  ScrollViewTopPadding.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import SwiftUI

struct ScrollViewTopPadding: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.top, 1.0)
    }
}

extension View {
    func scrollViewTransparentNavigation() -> some View {
        self.modifier(ScrollViewTopPadding())
    }
}


