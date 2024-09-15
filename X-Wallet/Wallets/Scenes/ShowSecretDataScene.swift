//
//  ShowSecretDataScene.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import SwiftUI
import Primitives
import Components
import Style

struct ShowSecretDataScene: View {
    
    let model: SecretPhraseViewableModel
    @State private var showCopyMessage = false

    var body: some View {
        VStack(spacing: Spacing.medium) {
            CalloutView.error(
                title: Localized.SecretPhrase.DoNotShare.title,
                subtitle: Localized.SecretPhrase.DoNotShare.description
            )
            .padding(.top, Spacing.scene.top)

            SecretDataTypeView(type: model.type)

            Button {
                showCopyMessage = true
                UIPasteboard.general.string = model.copyValue
            } label: {
                Text(Localized.Common.copy)
            }
            Spacer()
        }
        .modifier(ToastModifier(
            isPresenting: $showCopyMessage,
            value: CopyTypeViewModel(type: model.copyType).message,
            systemImage: SystemImage.copy
        ))
        .frame(maxWidth: Spacing.scene.content.maxWidth)
        .navigationTitle(model.title)
    }
}
