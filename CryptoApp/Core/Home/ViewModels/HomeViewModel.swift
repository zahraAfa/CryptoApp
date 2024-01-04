//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 18/12/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject{
    @Published var statistics: [StatisticModel] = [
            StatisticModel(title: "Title", value: "Value", percentageChange: 1),
            StatisticModel(title: "Title", value: "Value", percentageChange: nil),
            StatisticModel(title: "Title", value: "Value", percentageChange: nil),
            StatisticModel(title: "Title", value: "Value", percentageChange: -7),
        ]
        
        @Published var allCoins: [CoinModel] = []
        @Published var portfolioCoins: [CoinModel] = []
        @Published var searchText: String = ""
        
        private let coinDataServices = CoinDataService()
        private let marketDataServices = MarketDataService()
        private var cancellables = Set<AnyCancellable>()
        
        init() {
            addSubscribers()
        }
        
        func addSubscribers(){
            $searchText
                .combineLatest(coinDataServices.$allCoins)
                .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
                .map(filterCoins)
                .sink { [weak self] (returnedCoins) in
                    self?.allCoins = returnedCoins
                }
                .store(in: &cancellables)
            
            marketDataServices.$marketData.map { (marketDataModel)-> [StatisticModel] in
                var stats: [StatisticModel] = []
                
                guard let data = marketDataModel else {
                    print("Empty")
                    return stats
                }
                
                let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
                let volume = StatisticModel(title: "Volume", value: data.volume, percentageChange: nil)
                let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance, percentageChange: nil)
                let portfolio = StatisticModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
                
                stats.append(contentsOf: [
                    marketCap,
                    volume,
                    btcDominance,
                    portfolio
                ])
                
                return stats
            }.sink { [weak self] (returnedStats) in
                self?.statistics = returnedStats
            }.store(in: &cancellables)

        }
        
        private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
            guard !text.isEmpty else {
                return coins
            }
            
            let lowercasedText = text.lowercased()
            
            return coins.filter { (coin) -> Bool in
                return coin.name.lowercased().contains(lowercasedText) ||
                coin.id.lowercased().contains(lowercasedText) ||
                coin.symbol.lowercased().contains(lowercasedText)
            }
        }
}
