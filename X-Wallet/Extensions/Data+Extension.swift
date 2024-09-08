//
//  Data+Extension.swift
//  X-Wallet
//
//  Created by Duc Le on 8/28/24.
//

import Foundation

extension Data {
    
    var jsonString: String? {
        guard
            let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let prettyPrintedData = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedBody = String(data: prettyPrintedData, encoding: .utf8)
        else {
            return nil
        }
        
        return prettyPrintedBody
    }
    
}
