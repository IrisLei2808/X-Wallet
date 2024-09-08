//
//  TabBarView.swift
//  X-Wallet
//
//  Created by Duc Le on 8/30/24.
//

import SwiftUI

struct TabBarView: View {
    
    @EnvironmentObject var data: XWalletData
    @Binding var selectedTab: TabViewItemType
    
    var body: some View {
        HStack {
            Spacer()
            TabViewItem(type: .home, selectedTab: selectedTab, title: data.strings.tabHome) { selectedTab = .home}
            Spacer()
            TabViewItem(type: .wallet, selectedTab: selectedTab, title: data.strings.tabWallet)  { selectedTab = .wallet}
            Spacer()
            TabViewItem(type: .market, selectedTab: selectedTab, title: data.strings.tabMarket)  { selectedTab = .market}
            Spacer()
            TabViewItem(type: .settings, selectedTab: selectedTab, title: data.strings.tabSetting)  { selectedTab = .settings}
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
