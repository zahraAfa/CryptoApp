//
//  PreviewProvider.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 18/12/23.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview{
        return DeveloperPreview.instance
    }
}

class DeveloperPreview{
    static let instance = DeveloperPreview()
    private init(){
        
    }
    
    let coin = CoinModel(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 41094, marketCap: 801667910887, marketCapRank: 1, fullyDilutedValuation: 860095553409, totalVolume: 20525020186, high24H: 42319, low24H: 40789, priceChange24H: -714.7250568227464, priceChangePercentage24H: -1.70951, marketCapChange24H: -16360708566.888184, marketCapChangePercentage24H: -2.00002, circulatingSupply: 19573437, totalSupply: 21000000, maxSupply: 21000000, ath: 69045, athChangePercentage: -40.67402, athDate: "2021-11-10T14:24:11.849Z", atl: 67.81, atlChangePercentage: 60307.15724, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2023-12-18T09:45:08.592Z", sparklineIn7D: SparklineIn7D(price: [
        41963.918435869426,
        41983.16618652562,
        42130.029010755534,
        42203.07612417308,
        42289.044855997876,
        42384.16182852714,
        42345.67055988128,
        42211.75130516923,
        42070.62720658794,
        41898.11604074295,
        41862.78867550699,
        41678.24259803585,
        41332.88950352128,
        40983.403277832826,
        40753.09799675056,
        40819.09242130922,
        41090.42517461659,
        41259.3097335054,
        41262.42774346128,
        41657.03627972297,
        41650.24315559637,
        41841.00358261786,
        41736.848805059926,
        41515.07283688436,
        41523.985629395705,
        41651.730244341976,
        42013.95727808587,
        42026.30464430417,
        41842.45594603396,
        41772.858482883326,
        41609.024084227676,
        41865.28359097863,
        41862.05316636862,
        41467.71365603181,
        41298.866947463066,
        41301.18543434075,
        40720.052615882276,
        41251.16516288981,
        41083.08102526008,
        41234.11289620644,
        41066.78005858458,
        41243.529922413894,
        41450.819387377436,
        41402.20524534755,
        41077.682664111395,
        40987.371856768616,
        40804.87516728444,
        40892.5456601397,
        40961.11667003693,
        40886.84969702335,
        41108.21612991579,
        41210.73220951229,
        41202.76530861262,
        41075.82122712554,
        40959.7745311822,
        41124.5699534689,
        41444.99746245883,
        41425.82037999901,
        41869.404129598704,
        41844.2458858634,
        42091.78246722764,
        42074.91076481174,
        42770.01584143941,
        42856.79358974412,
        43038.42897688392,
        43044.914433991085,
        42885.34413554673,
        42771.9634610874,
        42851.56536198936,
        42782.21089895684,
        42703.38112158031,
        42723.860398772296,
        42766.04600099997,
        42960.06086336163,
        42902.33179390111,
        42797.25427858573,
        42913.54272252713,
        42977.850332594106,
        43199.21674485783,
        43109.29539903041,
        42600.47961294108,
        42526.25713180226,
        42414.76106217256,
        42608.2753512864,
        43259.13740775674,
        42842.611379969756,
        43108.57999753598,
        42906.92767090652,
        42927.05147686873,
        43088.719481125474,
        43032.27206078472,
        42905.33362930727,
        42980.92442700977,
        42927.963067221244,
        42816.15591306325,
        42790.78088450482,
        42633.83369701004,
        42555.978932492915,
        42650.56697586513,
        42805.507827933056,
        42818.7601345539,
        42842.818350832946,
        42773.081068252715,
        42621.547666136525,
        42220.76421116266,
        42040.620551485226,
        41887.948616699185,
        41761.06190446552,
        41831.93120570689,
        42078.93201285912,
        42019.01479863376,
        42242.59759874953,
        42222.6250513905,
        42093.204315945004,
        41889.934067028706,
        41887.541929918116,
        42055.200788661576,
        42135.581666162456,
        42371.19896730172,
        42264.21744215516,
        42217.64971299361,
        42178.5895500895,
        42201.54127714593,
        42150.7272070367,
        42217.169007236684,
        42213.66968847811,
        42290.04331379662,
        42364.065126544025,
        42369.15453638646,
        42328.58495622493,
        42455.90382816067,
        42538.61144249387,
        42523.65828775507,
        42430.85433343593,
        42327.72720339319,
        42301.03314934935,
        42262.61083778796,
        42280.784343161606,
        42247.06788172229,
        42168.232372076774,
        41964.70011838841,
        41895.91774791801,
        41896.79500044721,
        42008.21808088685,
        41836.5143907031,
        41846.17371588738,
        41832.58772096187,
        41856.595616305305,
        41880.318950690795,
        41951.23687802432,
        41912.421881823444,
        41897.35997205789,
        41780.984899072915,
        41618.83091158944,
        41796.88915488057,
        41936.18667039124,
        42019.197118232034,
        42108.513073472575,
        42067.25282235073,
        42093.60762392116,
        41897.02825234679,
        41690.75643956573,
        41410.819634575855,
        41362.91171945094,
        41104.51177162253,
        40934.408011580774,
        41078.59754461657,
        41192.25956971891
    ]), priceChangePercentage24HInCurrency: -1.7095065213297476, currentHoldings: 1.5)
}
