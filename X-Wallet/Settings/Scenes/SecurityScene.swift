//
//  SecurityScene.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import SwiftUI
import Components
import LocalAuthentication
import Style

struct SecurityScene: View {
    
    let model: SecurityViewModel
    @State public var authenticationEnabled: Bool
    @State public var authenticationInProgress: Bool = false
    @State private var isPresentingErrorMessage: String?

    init(
        model: SecurityViewModel
    ) {
        self.model = model
        self.authenticationEnabled = model.authenticationEnabled
    }
    
    var body: some View {
        List {
            HStack {
                Toggle(
                    model.authenticationTitle,
                    isOn: $authenticationEnabled
                )
                .toggleStyle(AppToggleStyle())
            }
        }
        .onChange(of: authenticationEnabled) {
            Task {
                let context = LAContext()
                do {
                    guard try await context.evaluatePolicy(.deviceOwnerAuthentication,
                        localizedReason: Localized.Settings.Security.authentication
                    ) else {
                        return
                    }
                    do {
                        try model.changeEnableBiometrics(value: authenticationEnabled, context: context)
                    } catch {
                        DispatchQueue.main.async {
                            isPresentingErrorMessage = error.localizedDescription
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        authenticationEnabled = model.authenticationEnabled
                    }
                }
            }
        }
        .alert(item: $isPresentingErrorMessage) {
            Alert(title: Text("Transfer Error"), message: Text($0))
        }
        .navigationTitle(model.title)
    }
    
    func changeEnableBiometrics(value: Bool) {
        
    }
}
