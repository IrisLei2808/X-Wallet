//
//  CustomTextFieldWithTitle.swift
//  X-Wallet
//
//  Created by Duc Le on 8/27/24.
//

import SwiftUI

struct CustomTextFieldWithTitle: View {
    @Binding var text: String
    var leadingImageName: String?
    var trailingImageName: String?
    var trailingString: String?
    var title: String
    var placeholderText: String = ""
    var placeholderTextColor: Color = Colors.blue70White
    var isSecureEntry: Bool = false
    var isMultiLineEntry: Bool = false
    var trailingImageAction: (() -> Void)?
    var body: some View {
        VStack(spacing: 8) {
            CustomText(
                name: title,
                textColor: Colors.blue70White70,
                font: Fonts.regularFont12)
            CustomTextField(
                text: $text,
                leadingImageName: leadingImageName,
                trailingImageName: trailingImageName,
                trailingString: trailingString,
                placeholderText: placeholderText,
                placeholderTextColor: placeholderTextColor,
                trailingImageAction: trailingImageAction,
                isSecureEntry: isSecureEntry,
                isMultiLineEntry: isMultiLineEntry)
        }
    }
}
