//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 18/12/23.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    @StateObject private var viewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView().navigationBarHidden(true)
            }
            .environmentObject(viewModel)
        }
    }
}
