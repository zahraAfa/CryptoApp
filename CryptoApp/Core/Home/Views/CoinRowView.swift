//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 18/12/23.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0){
            leftColumn
            Spacer()
            if showHoldingsColumn {
                VStack(alignment: .trailing){
                    Text(coin.currentHoldingsValue.asCurrencyWith6Decimals())
                    Text("\(coin.currentHoldings ?? 0, specifier: "%.2f")")
                }
            }
            
            rightColumn
        }
        .font(.subheadline)
    }
}

#Preview {
    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsColumn: true)
}

extension CoinRowView {
    private var leftColumn: some View{
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.subheadline)
                .foregroundStyle(Color.theme.secondaryText)
                .frame(minWidth: 30)
            
            CoinImageView(imageUrl: coin.image)
                .frame(width: 30, height: 30)

            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accent)
            
        }
    }
        
        private var rightColumn: some View{
                VStack(alignment: .trailing){
                    Text(coin.currentPrice.asCurrencyWith6Decimals())
                        .bold()
                    Text("\(coin.priceChangePercentage24H ?? 0, specifier: "%.2f")%")
                        .foregroundStyle(
                            (coin.priceChangePercentage24H ?? 0) >= 0 ?
                            Color.theme.green :
                            Color.theme.red
                        )
                }
                .frame(width: UIScreen.main.bounds.width / 3, alignment: .trailing)
            }
}
