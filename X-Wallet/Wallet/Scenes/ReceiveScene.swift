//
//  ReceiveScene.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import SwiftUI
import Components
import Style

struct ReceiveScene: View {
    
    let model: ReceiveViewModel
    let generator = QRCodeGenerator()
    
    @State private var showShareSheet = false
    @State private var showCopyMessage = false
    @State private var renderedImage = UIImage()

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image(uiImage: renderedImage)
                    .interpolation(.none)
                    .resizable()
                    .frame(width: 240, height: 240, alignment: .center)
                    .cornerRadius(8)
            }
            .padding(8)
            .padding(.bottom, 24)
            
            VStack {
                HStack {
                    Text(model.address)
                        .lineLimit(1)
                        .truncationMode(.middle)
                        .frame(maxWidth: .infinity)
                    Spacer()
                    Button(Localized.Common.copy, action: copyAddress)
                        .buttonStyle(.blue(paddingHorizontal: 8, paddingVertical: 6))
                        .fixedSize()
                }.padding(8)
            }
            .frame(maxWidth: 320)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.5)
            )
            Spacer()
            Button(action: {
                showShareSheet.toggle()
            }) {
                Text(Localized.Common.share)
            }
            .buttonStyle(.blue())
            .padding(.bottom, Spacing.scene.bottom)
            .frame(maxWidth: Spacing.scene.button.maxWidth)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showShareSheet.toggle()
                } label: {
                    Image(systemName: SystemImage.share)
                }
            }
        }
        .sheet(isPresented: $showShareSheet) {
            ShareSheet(activityItems: [model.sharableText])
        }
        .frame(maxWidth: .infinity)
        .modifier(
            ToastModifier(
                isPresenting: $showCopyMessage,
                value: CopyTypeViewModel(type: .address(model.assetModel.asset, address: model.addressShort)).message,
                systemImage: SystemImage.copy
            )
        )
        .navigationBarTitle(model.title)
        .taskOnce {
            // generate image in the background
            DispatchQueue.global(qos: .background).async {
                let image = generator.generate(from: model.address)
                DispatchQueue.main.async {
                    renderedImage = image
                }
            }
            model.enableAsset()
            
            try? model.walletsService.updateNode(chain: model.assetModel.asset.chain)
        }
    }
    
    func copyAddress() {
        showCopyMessage = true
        UIPasteboard.general.string = model.address
    }
}
