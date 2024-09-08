//
//  LocalStorage.swift
//  X-Wallet
//
//  Created by Duc Le on 8/27/24.
//

import SwiftUI

class LocalStorage {
    private init(){}
    
    static let shared = LocalStorage()
    
    @AppStorage("isUserLoggedIn") var isUserLoggedIn: Bool = false
    
    @AppStorage("selectedLanguage") var selectedLanguage: String?
}
