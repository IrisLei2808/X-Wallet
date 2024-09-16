//
//  ChartScene.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import SwiftUI
import Charts
import Primitives
import Style
import Components
import GRDB
import GRDBQuery
import Store

struct ChartScene: View {
    
    @StateObject var model: ChartsViewModel
    
    @Query<AssetRequest>
    var assetData: AssetData
    
    init(
        model: ChartsViewModel
    ) {
        _model = StateObject(wrappedValue: model)
        _assetData = Query(constant: model.assetRequest, in: \.db.dbQueue)
    }
    
    var body: some View {
        List {
            Section { } header: {
                VStack {
                    VStack {
                        switch model.state {
                        case .noData:
                            StateEmptyView(title: model.emptyTitle)
                        case .loading:
                            LoadingView()
                        case .loaded(let model):
                            ChartView(model: model)
                        case .error(let error):
                            StateEmptyView(
                                title: model.errorTitle,
                                description: error.localizedDescription,
                                image: Image(systemName: SystemImage.errorOccurred)
                            )
                        }
                    }
                    .frame(height: 320)

                    HStack(alignment: .center, spacing: 10) {
                        ForEach(model.periods, id: \.period) { period in
                            Button {
                                model.currentPeriod = period.period
                            } label: {
                                Text(period.title)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity)
                                    .padding(6)
                                    .background(model.currentPeriod == period.period ? Colors.white : .clear)
                                    .cornerRadius(8)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .textCase(nil)
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
            
            if let details = assetData.details {
                let model = AssetDetailsInfoViewModel(asset: assetData.asset, details: details)
                Section {
                    ForEach(model.marketValues, id: \.title) {
                        ListItemView(title: $0.title, subtitle: $0.subtitle)
                    }
                }
                Section(Localized.Social.links) {
                    ForEach(details.socialUrls) { link in
                        NavigationCustomLink(with: ListItemView(title: link.type.name, image: link.type.image)) {
                            UIApplication.shared.open(link.url)
                        }
                    }
                }
            }
        }
        .refreshable {
            await fetch()
        }
        .taskOnce {
            Task { await model.updateAsset() }
            Task { await model.updateCharts() }
        }
        .navigationTitle(model.title)
    }
    
    func fetch() async {
        await model.updateCharts()
    }
}