//
//  NotificationView.swift
//  X-Wallet
//
//  Created by Duc Le on 8/31/24.
//

import SwiftUI

struct NotificationView: View {
    
    @EnvironmentObject var data: XWalletData
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var currentTab: NotificationType = .system
    @StateObject private var viewModel: NotificationViewModel
    
    init(viewModel: NotificationViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Spacer().frame(height: 8)
            NotificationTypeSegmentView(
                notificationTypes: NotificationType.allCases,
                currentTab: $currentTab)
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(viewModel.notificationList) { notification in
                        NavigationLink(destination: NotificationDetailView(notification: notification)) {
                            NotificationCardView(vm: notification)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden()
        .background(
            BackgroundGradientView()
        )
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image("back")
                    .padding(.leading, 12)
            }
        )
        .toolbar {
            ToolbarItem(placement: .principal) {
                ToolbarContentView(title: data.strings.notifications)
            }
        }
        .onChange(of: currentTab) { newValue in
            withAnimation {
                viewModel.getNotifications(of: newValue)
            }
            
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NotificationView(viewModel: NotificationViewModel())
                .environmentObject(XWalletData())
        }
    }
}
