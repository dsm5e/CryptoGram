//
//  CircleButtonAnimation.swift
//  CryptoGram
//
//  Created by dsm 5e on 17.09.2023.
//

import SwiftUI

struct CircleButtonAnimation: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .blur(radius: animate ? 1 : 3)
            .foregroundStyle(Color.theme.accent)
            .animation(animate ? .easeOut(duration: 1.0) : .none, value: animate)
    }
}

#Preview {
    CircleButtonAnimation(animate: .constant(true))
        .foregroundStyle(Color.theme.red)
        .frame(width: 100, height: 100)
}
