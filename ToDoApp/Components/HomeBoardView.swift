//
//  HomeBoardView.swift
//  ToDoAppUI
//
//  Created by Beatriz Cardozo on 28/8/24.
//

import SwiftUI
import SwiftData

struct HomeBoardView: View {
    
    var totalCompletedPercentage: CGFloat
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color("PrimaryColor"))
                .frame(height: 120)
            
            HStack (spacing: 24) {
                    Text(totalCompletedPercentage < 20 ? "Keep pushing forward!" :
                            totalCompletedPercentage < 40 ? "Progress is looking good!" :
                            totalCompletedPercentage < 60 ? "Halfway there, keep it up!" :
                            totalCompletedPercentage < 85 ? "You're making great progress!" :
                            totalCompletedPercentage < 85 ? "Almost there, keep pushing!" :
                            "Done! You're killing it!"
                                            )
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.custom(boldFont, size: 14))
                        .frame(width: 120, height: 70)
                Spacer()
                ZStack {
                    Circle()
                        .stroke(Color(.lightGray), lineWidth: 5)
                        .frame(width: 80, height: 80)
                    
                    Circle()
                        .trim(from: 0.0, to: CGFloat(totalCompletedPercentage/100))
                        .stroke(.white, lineWidth: 5)
                        .frame(width: 80, height: 80)

                    Text(String(format: "%.0f", totalCompletedPercentage) + "%")
                        .foregroundStyle(.white)
                        .font(.custom(boldFont, size: 18))
               }
                .padding(.horizontal)
            }
            .padding(.horizontal)
        }
        .padding(.horizontal, 32)
    }
}

#Preview {
    HomeBoardView(totalCompletedPercentage: 0.85)
}
