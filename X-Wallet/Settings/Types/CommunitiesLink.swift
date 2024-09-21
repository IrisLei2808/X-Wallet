//
//  CommunitiesLink.swift
//  X-Wallet
//
//  Created by Duc Le on 9/20/24.
//

import Foundation
import SwiftUI

struct CommunitiesLink: Identifiable {
    let id = UUID()
    let type: SocicalUrls
    let url: URL
}

public enum SocicalUrls {
    case gitHub
    case youTube
    case telegram
    case discord
    case reddit
    case coingecko
}

public struct Socials {
    public static func url(_ type: SocicalUrls) -> URL? {
        switch type {
        case .gitHub:
            return URL(string: "https://github.com/IrisLei2808/X-Wallet/tree/develop")
        case .telegram:
            return URL(string: "https://www.telegram.com")
        case .youTube:
            return URL(string: "https://www.youtube.com")
        case .discord:
            return URL(string: "https://discord.com")
        case .reddit:
            return URL(string: "https://www.reddit.com")
        case .coingecko:
            return URL(string: "https://www.coingecko.com")
        }
    }
}

extension SocicalUrls {
    var name: String {
        switch self {
        case .gitHub: Localized.Social.github
        case .telegram: Localized.Social.telegram
        case .youTube: Localized.Social.youtube
        case .discord: Localized.Social.discord
        case .reddit: Localized.Social.reddit
        case .coingecko: Localized.Social.coingecko
        }
    }
    var image: Image {
        switch self {
        case .gitHub: Image(.github)
        case .telegram: Image(.telegram)
        case .youTube: Image(.youtube)
        case .discord: Image(.discord)
        case .reddit: Image(.reddit)
        case .coingecko: Image(.coingecko)
        }
    }
}
