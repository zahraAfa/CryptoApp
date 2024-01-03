//
//  SearchBarView.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 27/12/23.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass").foregroundColor(searchText.isEmpty ? .theme.secondaryText : .theme.accent)
            TextField("Search by name or symbol...", text: $searchText)
                .autocorrectionDisabled(true)
                .foregroundColor(.theme.accent)
        }
        .padding()
        .background(alignment: .center) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.15) ,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .overlay(alignment: .trailing, content: {
                    
                    if !searchText.isEmpty{
                        Image(systemName: "delete.left")
                            .padding(.trailing)
                            .foregroundColor(.theme.accent)
                            .onTapGesture {
                                searchText = ""
                                UIApplication.shared.endEditing()
                            }
                    }
                    
                })
        }
        
        .padding()
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
