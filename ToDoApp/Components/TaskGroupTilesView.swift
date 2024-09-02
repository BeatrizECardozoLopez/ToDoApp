//
//  TaskGroupTilesView.swift
//  ToDoAppUI
//
//  Created by Beatriz Cardozo on 28/8/24.
//

import SwiftUI
import SwiftData


struct TaskGroupTilesView: View {
    
    //MARK: Variables
    var category: String
    var icon: String
    var primaryColor: Color
    var secondaryColor: Color
    var completedPercentage: CGFloat
    var totalTasks: String
    
    var body: some View {
        
        HStack{
            Image(systemName: icon)
                .foregroundStyle(primaryColor)
                .font(.system(size: 18))
                .padding(.vertical, 15)
                .padding(.horizontal, 12)
                .background(secondaryColor)
                .cornerRadius(10)
            VStack (alignment: .leading, spacing: 6){
                Text(category)
                    .font(.custom(semiBoldFont, size: 16))
                
                Text(totalTasks)
                    .font(.custom(boldFont, size: 12))
                    .kerning(0.5)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 5)
            Spacer()
            ZStack {
                Circle()
                    .stroke(secondaryColor, lineWidth: 5)
                    .frame(width: 50, height: 50)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(completedPercentage/100))
                    .stroke(primaryColor, lineWidth: 5)
                    .frame(width: 50, height: 50)

                Text(String(format: "%.0f", completedPercentage) + "%")
                    .font(.custom(semiBoldFont, size: 12))
           }
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
        .frame(width: UIScreen.main.bounds.width - 50)
        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 2)
        //.padding(.vertical, 12)
    }
}

#Preview {
    TaskGroupTilesView(category: "Office Project", icon: "briefcase.fill", primaryColor: Color("OfficePrimaryColor"), secondaryColor: Color("OfficeSecondaryColor"), completedPercentage: 0.7, totalTasks: "23 Tasks")
}
