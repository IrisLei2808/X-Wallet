//
//  NotificationTypeSegmentView.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import SwiftUI

struct NotificationTypeSegmentView: View {
    var notificationTypes: [NotificationType]
    @Binding var currentTab: NotificationType
    var body: some View {
        HStack(spacing: 0) {
            ForEach(notificationTypes) { item in
                Button {
                    currentTab = item
                } label: {
                    if currentTab == item {
                        HStack(spacing: 0) {
                            CustomText(name: item.title, textColor: Colors.blueWhite, alignment: .center, font: Fonts.regularFont14,
                                       maxWidth: false,
                                       lineLimit: 1)
                       
                            Circle()
                                .fill(Colors.brown)
                                .frame(width: 10, height: 10)
                                .padding(.leading, 2.0)
                        }
                    } else {
                        CustomText(name: item.title, textColor: Colors.blueWhite.opacity(0.7), alignment: .center, font: Fonts.regularFont14, maxWidth: false)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.vertical, 12.0)
    }
}


