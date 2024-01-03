//
//  CoinImageViewModel.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 23/12/23.
//

import Foundation
import SwiftUI

class CoinImageViewModel: ObservableObject{
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    init(){
//        getImage(imageUrl: <#T##String#>)
    }
    
    func getImage(imageUrl: String){
        
    }
}
