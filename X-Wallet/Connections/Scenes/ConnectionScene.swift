//
//  ConnectionScene.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import SwiftUI
import Components

struct ConnectionScene: View {
    
    @Environment(\.dismiss) private var dismiss
    let model: ConnectionSceneViewModel
    
    var body: some View {
        List {
            Section {
                ConnectionView(model: model.model)
            }
            Section {
                ListItemView(title: model.walletField, subtitle: model.walletText)
                ListItemView(title: model.dateField, subtitle: model.dateText)
            }
            Section {
                Button(Localized.WalletConnect.disconnect, role: .destructive) {
                    Task {
                        await disconnect()
                    }
                    dismiss()
                }
            }
        }
        .navigationTitle(model.title)
    }
    
    func disconnect() async {
        do {
            try await model.disconnect()
        } catch {
            NSLog("disconnect error: \(error)")
        }
    }
}
