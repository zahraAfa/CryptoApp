//
//  StaticModel.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 28/12/23.
//

import Foundation

class StatisticModel: Identifiable{
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double?) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}
