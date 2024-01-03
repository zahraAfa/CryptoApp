//
//  MarketDataService.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 02/01/24.
//

import Foundation
import Combine

class MarketDataService {
    @Published var marketData: MarketDataModel? = nil
//    var coinSubscription: AnyCancellable?
    init(){
        getData()
    }
    
    private func getData(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {
            return
        }
        
        ServiceManager.shared.execute(URLRequest(url: url), expacting: GlobalData.self) { result in
            switch result{
            case .success(let model):
                print("Success")
                print(result)
                self.marketData = model.data
                break
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }

    }
}
