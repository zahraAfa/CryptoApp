//
//  CircleButtonView.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 18/12/23.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(Circle().foregroundColor(Color.theme.background))
            .shadow(color: Color.theme.accent.opacity(0.25), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 0)
    }
}

#Preview {
    Group{
        CircleButtonView(iconName: "heart.fill").previewLayout(.sizeThatFits).colorScheme(.light)
        CircleButtonView(iconName: "heart.fill").previewLayout(.sizeThatFits).colorScheme(.dark)
    }
}
