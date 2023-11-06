//
//  XmarkButton.swift
//  CryptoGram
//
//  Created by dsm 5e on 20.09.2023.
//

import SwiftUI

struct XmarkButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "xmark")
        })
    }
}

#Preview {
    XmarkButton()
}
