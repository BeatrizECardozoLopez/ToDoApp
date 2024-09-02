//
//  ProgressCardView.swift
//  ToDoAppUI
//
//  Created by Beatriz Cardozo on 28/8/24.
//

import SwiftUI
import SwiftData

struct ProgressCardView: View {
    //MARK: Variables
    @State var category: Category
    var taskTitle: String
    var icon: String
    var primaryColor: Color
    var secondaryColor: Color
    
    var body: some View {
        VStack (alignment: .leading, spacing: 6){
            HStack {
                Text(category.toString())
                    .font(.custom(semiBoldFont, size: 12))
                .foregroundStyle(.secondary)
                Spacer()
                Image(systemName: icon)
                    .foregroundStyle(primaryColor)
                    .font(.system(size: 16))
                    .padding(.bottom, 10)
                    .padding(.horizontal, 12)
            }
            Text(taskTitle)
                .font(.custom(semiBoldFont, size: 18))
                .kerning(0.5)
                .foregroundStyle(.primary)
                .padding(.bottom, 15)
        }
        .padding()
        .background(secondaryColor)
        .cornerRadius(20)
        .frame(width: 300)
        //.padding(.vertical, 12)
    }
}

#Preview {
    ProgressCardView(category: Category.office, taskTitle: "Work", icon: "briefcase.fill", primaryColor: Color("OfficePrimaryColor"), secondaryColor: Color("OfficeSecondaryColor"))
}
