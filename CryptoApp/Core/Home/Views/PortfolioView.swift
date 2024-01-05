//
//  PortfolioView.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 04/01/24.
//

import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject private var homeViewModel: HomeViewModel
    @StateObject private var viewModel = PortfolioViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading, spacing: 0, content: {
                    SearchBarView(searchText: $homeViewModel.searchText)
                    
                    coinLogoList
                    
                    if viewModel.selectedCoin != nil {
                        portfolioInputSection
                    }
                })
            }.navigationTitle("Add Portfolio")
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        XMarkButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        saveButton
                    }
                })
        }
    }
}

extension PortfolioView{
    private var coinLogoList: some View{
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(homeViewModel.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(viewModel.selectedCoin?.id == coin.id ? Color.theme.green : Color.clear, lineWidth: 1)
                        )
                        .onTapGesture {
                            viewModel.selectedCoin = coin
                        }
                }
                
            }.padding(.vertical, 4)
                .padding(.leading)
                .frame(height: 120)
        }
    }
    
    private var portfolioInputSection: some View{
        VStack(spacing: 20){
            HStack{
                Text("Current price of \(viewModel.selectedCoin?.symbol.uppercased() ?? "")")
                Spacer()
                Text(viewModel.selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            Divider()
            HStack{
                Text("Amount holding:")
                Spacer()
                TextField("Ex. 1.4", text: $viewModel.quantityText)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
            }
            Divider()
            HStack{
                Text("Current value:")
                Spacer()
                Text(viewModel.getTotalValue().asCurrencyWith2Decimals())
            }
        }
        .padding(.top, 20)
        .padding()
        .font(.headline)
    }
    
    private var saveButton: some View{
        HStack(spacing: 10){
            Image(systemName: "checkmark")
                    .opacity(viewModel.showCheckMark ? 1.0 : 0.0)
            Button {
                saveButtonPressed()
            } label: {
                Text("Save".uppercased())
            }
            .opacity(viewModel.selectedCoin != nil && viewModel.quantityText != "" ? 1.0 : 0.0 )
        }.font(.headline)
    }
    
    private func saveButtonPressed(){
        guard let coin = viewModel.selectedCoin else { return }
        
        withAnimation(.easeIn) {
            viewModel.showCheckMark = true
            removeSelectedCoin()
        }
        
        UIApplication.shared.endEditing()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2 ){
            viewModel.showCheckMark = false
        }
    }
    
    private func removeSelectedCoin(){
        viewModel.selectedCoin = nil
        viewModel.quantityText = ""
        homeViewModel.searchText = ""
    }
}

#Preview {
    PortfolioView()
        .environmentObject(HomeViewModel())
}
