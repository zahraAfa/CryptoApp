//
//  CoinImageView.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 22/12/23.
//

import SwiftUI

struct CoinImageView: View {
    
    var imageUrl: String
    
    var body: some View {
        imageView
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

extension CoinImageView{
    private var imageView: some View{
        AsyncImage(url: URL(string: imageUrl)) { image in
            switch image {
            case .success(let img):
                img.resizable()
                    .aspectRatio(contentMode: .fill)
            case .failure(_):
                Image(systemName: "questionmark").resizable().aspectRatio(contentMode: .fill)
            case .empty:
                Image(systemName: "photo").resizable().aspectRatio(contentMode: .fill)
            @unknown default:
                ProgressView()
            }
        }
    }
}

#Preview {
    CoinImageView(imageUrl: "")
}
