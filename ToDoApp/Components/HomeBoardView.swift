//
//  HomeBoardView.swift
//  ToDoAppUI
//
//  Created by Beatriz Cardozo on 28/8/24.
//

import SwiftUI

struct HomeBoardView: View {
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color("PrimaryColor"))
                .frame(height: 170)
            
            HStack (spacing: 24) {
                VStack (alignment: .leading, spacing: 24){
                    Text("Your today's task almost done!")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.custom(boldFont, size: 18))
                    
                    Button{
                        //TODO: funcionality
                    } label: {
                        Text("View Task")
                            .foregroundStyle(Color("PrimaryColor"))
                            .padding()
                            .font(.custom(boldFont, size: 18))
                    }
                    .background(.white)
                    .cornerRadius(20)
                }
                
                 
                
                ZStack {
                    Circle()
                        .stroke(Color(.lightGray), lineWidth: 5)
                        .frame(width: 80, height: 80)
                    
                    Circle()
                        .trim(from: 0.0, to: CGFloat(0.85))
                        .stroke(.white, lineWidth: 5)
                        .frame(width: 80, height: 80)

                    Text(String(format: "%.0f", 0.85*100) + "%")
                        .foregroundStyle(.white)
                        .font(.custom(boldFont, size: 18))
               }
                
                
            }
        }
        .padding(.horizontal, 32)
        
    }
}

#Preview {
    HomeBoardView()
}
