//
//  SwiftUIView.swift
//  HTM
//
//  Created by Aaron Cheung on 30/10/2022.
//

import SwiftUI

struct ColourGradient: View {
    @State private var animateGradient = false
    
    var body: some View {
        LinearGradient(colors: [.purple, .yellow], startPoint: animateGradient ? .topLeading : .bottomLeading, endPoint: animateGradient ? .bottomTrailing : .topTrailing)
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ColourGradient()
    }
}
