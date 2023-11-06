//
//  ContentView.swift
//  CryptoGram
//
//  Created by dsm 5e on 17.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Text("Accent Color")
                    .foregroundStyle(Color.theme.accent)
                
                Text("Secondary Text Color")
                    .foregroundStyle(Color.theme.secondaryText)
                
                Text("Red Color")
                    .foregroundStyle(Color.theme.red)

                Text("Green Color")
                    .foregroundStyle(Color.theme.green)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
