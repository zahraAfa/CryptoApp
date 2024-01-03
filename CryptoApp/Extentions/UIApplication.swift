//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 28/12/23.
//

import Foundation
import SwiftUI

extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
