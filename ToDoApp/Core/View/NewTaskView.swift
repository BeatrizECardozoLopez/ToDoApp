//
//  AddProjectView.swift
//  ToDoAppUI
//
//  Created by Beatriz Cardozo on 28/8/24.
//

import SwiftUI

struct NewTaskView: View {
    
    //@Binding var isShow: Bool
    @Binding var tasks: [Task]
    
    //MARK: Task fields
    @State var title: String = ""
    @State var selectedPriority: Priority = .normal
    @State var selectedCategory: Category = .office
    @State var isEditing = false
    
    var body: some View {
        
        VStack {
            TaskGroupPickerView(selectedCategory: self.$selectedCategory)
            
            PriorityPickerView(selectedPriority: self.$selectedPriority)
            
            TextFieldView(title: "Task Title", isMultiLine: false)
            
            TextFieldView(title: "Description", isMultiLine: true)
            
            Spacer()
            
        }
        
    }
}

struct TaskGroupPickerView: View {
    @Binding var selectedCategory: Category
    @State private var isExpanded: Bool = false
    
    var body: some View {
        
        HStack {
            Image(systemName: selectedCategory.iconImageName())
                .foregroundStyle(selectedCategory.primaryColor())
                .font(.system(size: 16))
                .padding(.vertical, 10)
                .padding(.horizontal, 8)
                .background(selectedCategory.secondaryColor())
                .cornerRadius(10)
            
            VStack (alignment: .leading) {
                Text("Task Group")
                    .font(.custom(boldFont, size: 14))
                    .foregroundStyle(.secondary)
                
                Text(selectedCategory.toString())
                    .font(.custom(boldFont, size: 16))
            }
            .padding(.horizontal)
            
            Spacer()
            
            Image("caret-down-solid")
                .resizable()
                .scaledToFill()
                .frame(width: 15, height: 15)
                .rotationEffect(.degrees(isExpanded ? -180 : 0))
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .frame(width: UIScreen.main.bounds.width - 50)
        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 2)
        .onTapGesture {
            withAnimation(.snappy) {isExpanded.toggle()}
        }
        .padding(.vertical, 12)

        if isExpanded {
            VStack {
                ForEach(Category.allCases, id: \.self) { category in
                    HStack {
                        Text(category.toString())
                            .font(.custom(semiBoldFont, size: 16))
                            .foregroundStyle(selectedCategory == category ? category.primaryColor() : .primary)
                        Spacer()
                        Image(systemName: category.iconImageName())
                            .foregroundColor(category.primaryColor())
                        
                    }
                    .padding(5)
                    .background(selectedCategory == category ? category.secondaryColor() : .white)
                    .cornerRadius(10)
                    .onTapGesture {
                        selectedCategory = category
                        withAnimation(.snappy) {isExpanded.toggle()}
                    }
                }
            }
            .padding()
            .background(.white)
            .cornerRadius(20)
            .frame(width: UIScreen.main.bounds.width - 50, height: 150)
            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 2)
            .padding(.top, -10)
        }
        
    }
}

#Preview {
    NewTaskView(tasks: .constant([]))
}


