//
//  ContentView.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 18/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            
            Color(Color.theme.background)
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!").foregroundStyle(Color.theme.secondaryText)
                Text("Hello, world!").foregroundStyle(Color.theme.green)
                Text("Hello, world!").foregroundStyle(Color.theme.red)
                Text("Hello, world!").foregroundStyle(Color.theme.accent)
            }
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
