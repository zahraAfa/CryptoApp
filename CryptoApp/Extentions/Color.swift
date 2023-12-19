//
//  Color.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 18/12/23.
//

import Foundation
import SwiftUI

extension Color{
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}
