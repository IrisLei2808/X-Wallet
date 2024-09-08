//
//  LoginProgressIndicatorView.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import SwiftUI

struct LoginProgressIndicatorView: View {
    var totalSteps: Int = 3
    @State var currentStep: Int
    @State private var scale = 0.1
    @State private var width = 0.0
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<totalSteps, id:\.self) { index in

                Group {
                    Circle()
                        .fill(index < currentStep ? Colors.brown : Colors.lightBlue)
                        .frame(width: 12, height: 12)
                        .scaleEffect(scale)

                    if index < totalSteps - 1 {
                        Rectangle()
                            .fill(index < (currentStep - 1) ? Colors.brown : Colors.lightBlue)
                            .frame(width: width, height: 2.0)
                    }
                }

            }
        }
        .frame(height: 44.0)
        
        .onAppear() {
            withAnimation(.easeInOut(duration:0.3).delay(0.2)) {
                scale = 1.0
                width = 100.0
            }
        }
    }
}

