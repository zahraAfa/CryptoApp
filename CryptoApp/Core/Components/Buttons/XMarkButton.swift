//
//  XMarkButton.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 03/01/24.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
            print("pressed exit")
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
        
    }
}

#Preview {
    XMarkButton()
}
