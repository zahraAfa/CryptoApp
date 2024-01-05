//
//  PortfolioViewModel.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 04/01/24.
//

import Foundation

class PortfolioViewModel: ObservableObject{
    @Published var selectedCoin: CoinModel? = nil
    @Published var quantityText: String = ""
    @Published var showCheckMark: Bool = false
    
    func getTotalValue() -> Double{
        if let quantity = Double(quantityText){
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
}
