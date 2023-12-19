//
//  Double.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 18/12/23.
//

import Foundation

extension Double {
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "Rp 0.00"
    }
    
    func asNumberString() -> String{
//        return "\(self, specifier: "%.2f")"
        return String(format: "%.2f", arguments:[self])
    }
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
