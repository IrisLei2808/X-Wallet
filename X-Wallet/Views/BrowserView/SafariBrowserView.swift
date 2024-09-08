//
//  SafariBrowserView.swift
//  X-Wallet
//
//  Created by Duc Le on 8/31/24.
//

import SwiftUI
import SafariServices

struct SafariWebView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let configuration = SFSafariViewController.Configuration()
        configuration.entersReaderIfAvailable = true
        
        let controller = SFSafariViewController(url: url, configuration: configuration)
        controller.preferredControlTintColor = Colors.brown.uiColor
        controller.preferredBarTintColor = Colors.brown8DarkBlue.uiColor
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
}