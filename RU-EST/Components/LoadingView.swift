//
//  LoadingView.swift
//  RU-EST
//
//  Created by Victor Ordozgoite on 18/03/23.
//

import SwiftUI

struct LoadingView: View {
    @State private var circle1Animating = false
        @State private var circle2Animating = false
        @State private var circle3Animating = false
        
        var body: some View {
            HStack(spacing: 10) {
                Circle()
                    .fill(Color.primaryColor)
                    .frame(width: 10, height: 10)
                    .scaleEffect(circle1Animating ? 1 : 0.5)
                    .animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true))
                
                Circle()
                    .fill(Color.primaryColor)
                    .frame(width: 10, height: 10)
                    .scaleEffect(circle2Animating ? 1 : 0.5)
                    .animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true).delay(0.3))
                
                Circle()
                    .fill(Color.primaryColor)
                    .frame(width: 10, height: 10)
                    .scaleEffect(circle3Animating ? 1 : 0.5)
                    .animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true).delay(0.6))
            }
            .background(
                Color.white.frame(width: 100, height: 100).cornerRadius(25)
            )
            .onAppear {
                circle1Animating = true
                circle2Animating = true
                circle3Animating = true
            }
        }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
