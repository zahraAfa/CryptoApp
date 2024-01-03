//
//  StatisticView.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 28/12/23.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4, content: {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
            HStack {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180))
                
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                .bold()
            }
            .foregroundColor((stat.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        })
    }
}

#Preview {
    Group{
        StatisticView(stat: DeveloperPreview.instance.state1).previewLayout(.sizeThatFits)
        StatisticView(stat: DeveloperPreview.instance.state2).previewLayout(.sizeThatFits)
        StatisticView(stat: DeveloperPreview.instance.state3).previewLayout(.sizeThatFits)
        
    }
}
