//
//  HomeView.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 18/12/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var viewModel: HomeViewModel
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack{
            Color.theme.background.ignoresSafeArea()
            VStack{
                homeHeader
                HomeStatsView(showPortfolio: $showPortfolio)
                SearchBarView(searchText: $viewModel.searchText)
                
                columnTitles
                
                if !showPortfolio{
                    if viewModel.allCoins.isEmpty{
                        Text("No coin available.")
                            .font(.callout).italic()
                            .foregroundStyle(Color.theme.secondaryText)
                            .padding()
                            .frame(alignment: .center)
                    }
                    allCoinsList
                    .transition(.move(edge: .leading))
                }
                
                if showPortfolio{
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
                Spacer()
            }
        }
    }
}

extension HomeView{
    private var homeHeader : some View{
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .background(
                CircleButtonAnimationView(animate: $showPortfolio))
                .onTapGesture {
                    withAnimation(.none){}
                }
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }.padding(.horizontal)
    }
    
    private var allCoinsList: some View{
            List{
                ForEach(viewModel.allCoins){ coin in
                    CoinRowView(coin: coin, showHoldingsColumn: false)
                        .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                }
            }
            .listStyle(PlainListStyle())
    }
    
    private var portfolioCoinsList: some View{
        List{
            ForEach(viewModel.portfolioCoins){ coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitles: some View {
        HStack{
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3, alignment: .trailing)
        }.font(.caption)
            .foregroundColor(.theme.secondaryText)
            .padding(.horizontal, 10)
            .padding(.top, 10)
    }
}

#Preview {
    NavigationView{
        HomeView()
            .navigationBarHidden(true)
    }.environmentObject(HomeViewModel())
}
