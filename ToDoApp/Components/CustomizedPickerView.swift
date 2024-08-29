//
//  CustomizedPicker.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 29/8/24.
//

import SwiftUI

struct CustomizedPickerView: View {
    @State private var selectedCategory: Category = .office
    
    var body: some View {
        Picker("", selection: $selectedCategory) {
            ForEach(Category.allCases, id: \.self) { category in
                HStack {
                    Image(systemName: category.iconImageName())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    Text(category.toString())
                        .foregroundColor(.primary)
                    Image(systemName: "chevron.down")
                        .foregroundColor(.primary)
                }
                .tag(category)
            }
        }
        .pickerStyle(MenuPickerStyle())
        .padding()
    }
}

#Preview {
    CustomizedPickerView()
}
