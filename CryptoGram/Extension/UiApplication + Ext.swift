//
//  UiApplication + Ext.swift
//  CryptoGram
//
//  Created by dsm 5e on 19.09.2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
