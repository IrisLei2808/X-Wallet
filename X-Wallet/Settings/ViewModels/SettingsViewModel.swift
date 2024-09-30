//
//  SettingsViewModel.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation
import SwiftUI
import Store
import Keystore
import GemstonePrimitives
import Gemstone
import Primitives

// TODO: - #1 think about to create some builder for List sections
// TODO: - #2 review observation migrate to @Observable
class SettingsViewModel: ObservableObject {
    @ObservedObject var currencyModel: CurrencySceneViewModel
    @ObservedObject var securityModel: SecurityViewModel

    @Published var isDeveloperEnabled: Bool {
        didSet { preferences.isDeveloperEnabled = isDeveloperEnabled }
    }

    private let walletId: WalletId
    private let walletsService: WalletsService
    private let preferences = Preferences.main

    init(
        walletId: WalletId,
        walletsService: WalletsService,
        currencyModel: CurrencySceneViewModel,
        securityModel: SecurityViewModel
    ) {
        self.walletId = walletId
        self.walletsService = walletsService
        self.currencyModel = currencyModel
        self.securityModel = securityModel
        self.isDeveloperEnabled = preferences.isDeveloperEnabled
    }

    var title: String { Localized.Settings.title }

    var walletsTitle: String { Localized.Wallets.title }
    var walletsValue: String { "\(walletsService.keystore.wallets.count)" }
    var walletsImage: Image { Image(.tabWallet) }

    var securityTitle: String { Localized.Settings.security }
    var securityImage: Image { Image(.settingSecurity) }

    var notificationsTitle: String { Localized.Settings.Notifications.title }
    var notificationsImage: Image { Image(.settingNotifications) }

    var currencyTitle: String { Localized.Settings.currency }
    var currencyValue: String {
        let currentCurrency = currencyModel.currency

        if let currentFlag = currencyModel.emojiFlag {
            return "\(currentFlag) \(currentCurrency)"
        }
        return currentCurrency
    }
    var currencyImage: Image { Image(.bitcoin) }

    var lanugageTitle: String { Localized.Settings.language }
    var lanugageValue: String {
        guard let code = Locale.current.language.languageCode?.identifier else {
            return ""
        }
        return Locale.current.localizedString(forLanguageCode: code)?.capitalized ?? ""
    }

    var lanugageImage: Image { Image(.settingLanguage) }

    var chainsTitle: String { Localized.Settings.Networks.title }
    var chainsImage: Image { Image(.settingNetworks) }

    var walletConnectTitle: String { Localized.WalletConnect.title }
    var walletConnectImage: Image { Image(.walletConnect) }

    var commutinyTitle: String { Localized.Settings.community }
    var communityLinks: [CommunitiesLink] {
        let links: [SocicalUrls] = [.reddit, .gitHub, .youTube, .telegram, .discord, .coingecko]

        return links.compactMap {
            if let url = Socials.url($0) {
                return CommunitiesLink(type: $0, url: url)
            }
            return .none
        }
    }
    
    var aboutUsTitle: String { Localized.Settings.aboutus }
    var aboutUsImage: Image { Image(.tabWallet) }

    var rateAppTitle: String { Localized.Settings.rateApp }
    var rateAppImage: Image { Image(.settingRate) }

    var developerModeTitle: String { Localized.Settings.developer }
    var developerModeImage: Image { Image(.settingDeveloper) }

    var versionTextTitle: String { Localized.Settings.version }
    var versionTextValue: String {
        let version = Bundle.main.releaseVersionNumber
        let number = Bundle.main.buildVersionNumber
        return "\(version) (\(number))"
    }
    var versionTextImage: Image { Image(.settingVersion) }

    var contextCopyTitle: String { Localized.Common.copy }
    var contextDevTitle: String { Localized.Settings.enableValue(Localized.Settings.developer) }

}

// MARK: - Business Logic

extension SettingsViewModel {
    func fetch() async throws {
        try await walletsService.changeCurrency(walletId: walletId)
    }
}
