//
//  CoinDataService.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 19/12/23.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allCoins : [CoinModel] = []
//    var coinSubscription: AnyCancellable?
    init(){
        getCoin()
        print(allCoins)
    }
    
    private func getCoin(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else {
            return
        }
        
        ServiceManager.shared.execute(URLRequest(url: url), expacting: [CoinModel].self) { result in
            switch result{
            case .success(let model):
                self.allCoins = model
                break
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }

    }
}
