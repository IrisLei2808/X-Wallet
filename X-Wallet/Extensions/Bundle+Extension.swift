//
//  Bundle+Extension.swift
//  X-Wallet
//
//  Created by Duc Le on 8/27/24.
//

import Foundation

extension Bundle {
    static func localeBundle(_ lang: String) -> Bundle {
        guard let path = Bundle.main.path(forResource: lang, ofType: "lproj") else {
            return Bundle.main
        }
        
        return Bundle(path: path) ?? Bundle.main
    }
}
