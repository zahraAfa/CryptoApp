//
//  HomeStatsView.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 04/01/24.
//

import SwiftUI

struct HomeStatsView: View {
    
    @Binding var showPortfolio: Bool
    
    @EnvironmentObject private var viewModel: HomeViewModel
    
    var body: some View {
        HStack{
            ForEach(viewModel.statistics) { stat in
                    StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
                
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
    }
}

#Preview {
    HomeStatsView(showPortfolio: .constant(false))
        .environmentObject(HomeViewModel())
}
