//
//  LockState.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import Foundation

enum LockState {
    case locked
    case unlocked
}

class LockStateService: ObservableObject {
    
    @Published var state: LockState
    
    public init(
        state: LockState
    ) {
        self.state = state
    }
}
