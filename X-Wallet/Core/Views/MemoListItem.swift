//
//  MemoListItem.swift
//  X-Wallet
//
//  Created by Duc Le on 9/14/24.
//

import SwiftUI
import Components

struct MemoListItem: View {
    
    let memo: String?
    
    var body: some View {
        ListItemView(
            title: Localized.Transfer.memo,
            subtitle: subtitle
        ).contextMenu {
            ContextMenuCopy(title: Localized.Common.copy, value: memo ?? "")
        }
    }
    
    private var subtitle: String {
        MemoFormatter.format(memo: memo)
    }
}


struct MemoFormatter {
    static func format(memo: String?) -> String {
        let value = memo ?? ""
        return value.isEmpty ? "-" : value
    }
}
