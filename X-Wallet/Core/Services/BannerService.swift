//
//  BannerService.swift
//  X-Wallet
//
//  Created by Duc Le on 9/14/24.
//

import Foundation
import Store
import Primitives

struct BannerService {

    let store: BannerStore

    init(store: BannerStore) {
        self.store = store
    }

    func closeBanner(banner: Banner) throws {
        try updateState(banner: banner, state: .cancelled)
    }

    func updateState(banner: Banner, state: BannerState) throws {
        let _ = try store.updateState(banner.id, state: state)
    }
}
