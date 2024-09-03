//
//  SplashScreenView.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 3/9/24.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 80))
                        .foregroundColor(Color("PrimaryColor"))
                        .padding()
                    
                    Text("GoalGetter")
                        .font(.custom(blackFont, size: 32))
                        .foregroundStyle(.primary)
                        .foregroundStyle(.black.opacity(0.8))
                        .padding(.bottom, 12)
                    
                    Text("Your path to productivity and progress!")
                        .font(.custom(boldFont, size: 16))
                        .foregroundStyle(.secondary)
                        .foregroundStyle(.black.opacity(0.8))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now () + 3.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
