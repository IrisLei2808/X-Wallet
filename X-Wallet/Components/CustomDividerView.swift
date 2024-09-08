//
//  CustomDividerView.swift
//  X-Wallet
//
//  Created by Duc Le on 8/27/24.
//

import SwiftUI

struct CustomDividerView: View {
    
    var height: CGFloat = 1
    var color: Color = Colors.brown25Blue70
    
    var body: some View {
        Rectangle()
             .fill(color)
             .frame(height: height)
             .background(color)
    }
}
