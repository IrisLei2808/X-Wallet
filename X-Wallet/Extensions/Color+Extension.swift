//
//  Color+Extension.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import UIKit
import SwiftUI

extension UIColor {
    var color: Color {
        Color(uiColor: self)
    }
}

extension Color {
    var uiColor: UIColor {
        UIColor(self)
    }
}
