//
//  CircleButton.swift
//  CryptoGram
//
//  Created by dsm 5e on 17.09.2023.
//

import SwiftUI

struct CircleButton: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
            Circle()
                .foregroundColor(Color.theme.background)
            )
            .shadow(color: Color.theme.accent.opacity(0.25), 
                    radius: 10, x: 0, y: 0)
            .padding()
    }
}

#Preview {
    Group {
        CircleButton(iconName: "info")
        
        CircleButton(iconName: "plus")
            .colorScheme(.dark)
    }
}
