//
//  CoinImageService.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 23/12/23.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService{
    @Published var image: UIImage? = nil
    private let coin: CoinModel
    private let fileManager = LocalFileManager.shared
    private let folderName = "coin_image"
    private let imageName: String
    
//
//    var imageSubscription: AnyCollection?
//    
    init(coin: CoinModel){
        self.coin = coin
        self.imageName = coin.id
    }
//
//    private func fetchImage(urlString: String){
//        guard let url = URL(string: urlString) else {return}
//        
//        imageSubscription = ServiceManager.shared
//    }
    
    private func getCoinImage(){
        if let savedImage = fileManager.getImage(imageName: coin.id, folderName: folderName){
            image = savedImage
            print("Retrieved image from file manager")
        }
    }
    
    private func downloadCoinImage(){
    }
}
