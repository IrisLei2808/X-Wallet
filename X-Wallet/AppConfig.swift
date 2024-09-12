//
//  AppConfig.swift
//  X-Wallet
//
//  Created by Duc Le on 9/9/24.
//

import Foundation
import Settings
import Primitives
import Keystore
import Components
import Store
import BigInt
import WalletConnector
import GemstonePrimitives
import Blockchain

extension Asset {
    static let main = Asset.bitcoin
    static let ethereum = Asset(id: Chain.ethereum.assetId, name: "Ethereum", symbol: "ETH", decimals: 18, type: .native)
    static let bitcoin = Asset(id: Chain.bitcoin.assetId, name: "Bitcoin", symbol: "BTC", decimals: 8, type: .native)
    static let cosmos = Asset(id: Chain.cosmos.assetId, name: "Cosmos", symbol: "Atom", decimals: 8, type: .native)
}

extension Balance {
    static let main = Balance(available: "10")
}

extension Price {
    static let main = Price(price: 10, priceChangePercentage24h: 21)
}

extension AssetMetaData {
    static let main = AssetMetaData(
        isEnabled: true,
        isBuyEnabled: true,
        isSwapEnabled: true,
        isStakeEnabled: false,
        isPinned: false)
}

extension AssetId {
    static let main = Self.ethereum
    static let ethereum = AssetId(id: "ethereum")!
    static let bitcoin = AssetId(id: "bitcoin")!
    static let binance = AssetId(id: "smartchain")!
}

extension AssetData  {
    static let main = AssetData(asset: .main, balance: .main, account: .main, price: .main, details: .none, metadata: .main)
}

extension Preferences {
    static let main = Preferences(defaults: .standard)
}

extension LocalKeystore {
    static let main = LocalKeystore(folder: "keystore", walletStore: .main, preferences: .main)
}

extension WalletStore {
    static let main = WalletStore(db: .main)
}

extension BannerStore {
    static let main = BannerStore(db: .main)
}

//extension AssetsService {
//    static let main = AssetsService(a)
//}

extension ChartService {
    static let main = ChartService()
}

extension BalanceService {
    static let main = BalanceService(
        balanceStore: .main,
        chainServiceFactory: .init(nodeProvider: NodeService.main)
    )
}

extension NodeService {
    static let main = NodeService(nodeStore: .main)
}

extension BalanceStore {
    static let main = BalanceStore(db: .main)
}

extension NodeStore {
    static let main = NodeStore(db: .main)
}

extension DB {
    static let main = DB(path: "db.sqlite")
}

extension Account {
    static let main = Account(chain: .bitcoin, address: "btc123123", derivationPath: "", extendedPublicKey: "")
}


