//
//  ProgressCardView.swift
//  ToDoAppUI
//
//  Created by Beatriz Cardozo on 28/8/24.
//

import SwiftUI

struct ProgressCardView: View {
    //MARK: Variables
    var category: String
    var taskTitle: String
    var icon: String
    var primaryColor: Color
    var secondaryColor: Color
    var completedPercentage: CGFloat
    
    var body: some View {
        
        
        VStack (alignment: .leading, spacing: 6){
            HStack {
                Text(category)
                    .font(.custom(semiBoldFont, size: 14))
                .foregroundStyle(.secondary)
                Spacer()
                Image(systemName: icon)
                    .foregroundStyle(primaryColor)
                    .font(.system(size: 20))
                    .padding(.top, 15)
                    .padding(.horizontal, 12)
            }
            Text(taskTitle)
                .font(.custom(semiBoldFont, size: 20))
                .kerning(0.5)
                .foregroundStyle(.primary)
                .padding(.bottom, 20)
            ProgressLine(color: primaryColor, progress: completedPercentage)
        }
        .padding()
        .background(secondaryColor)
        .cornerRadius(20)
        .frame(width: 300)
        //.padding(.vertical, 12)
    }
}


struct ProgressLine: View {
    var color: Color
    var progress: Double
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: 250, height: 10)
                .cornerRadius(10)
                .foregroundColor(.white)
            
            Rectangle()
                .frame(width: progress*250, height: 10)
                .foregroundColor(color)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ProgressCardView(category: "Office Project", taskTitle: "Grocery shopping app design", icon: "briefcase.fill", primaryColor: Color("OfficePrimaryColor"), secondaryColor: Color("OfficeSecondaryColor"), completedPercentage: 0.7)
}
