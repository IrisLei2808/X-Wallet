//
//  ClipboardManager.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import Foundation
import SwiftUI

final class ClipboardManager {
    
    static let shared = ClipboardManager()
    
    private init() {}
    
    func copyPlainText(_ text: String) {
        UIPasteboard.general.setValue(text, forPasteboardType: "public.plain-text")
    }
}
