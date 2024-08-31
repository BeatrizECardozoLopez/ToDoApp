//
//  PriorityPickerView.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 29/8/24.
//

import SwiftUI
import SwiftData

struct PriorityPickerView: View {
    @Binding var selectedPriority: Priority
    @State private var isExpandedP: Bool = false
    
    var body: some View {
        
        HStack {
            RoundedRectangle(cornerRadius: 10.0)
                .frame(width: 40, height: 40)
                .foregroundStyle(selectedPriority.secondaryColor())
            
            VStack (alignment: .leading) {
                Text("Priority")
                    .font(.custom(boldFont, size: 14))
                    .foregroundStyle(.secondary)
                
                Text(selectedPriority.toString())
                    .font(.custom(boldFont, size: 16))
            }
            .padding(.horizontal)
            
            Spacer()
            
            Image("caret-down-solid")
                .resizable()
                .scaledToFill()
                .frame(width: 15, height: 15)
                .rotationEffect(.degrees(isExpandedP ? -180 : 0))
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .frame(width: UIScreen.main.bounds.width - 50)
        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 2)
        .onTapGesture {
            withAnimation(.snappy) {isExpandedP.toggle()}
        }
        .padding(.vertical, 12)

        if isExpandedP {
            VStack {
                ForEach(Priority.allCases, id: \.self) { priority in
                    HStack {
                        Text(priority.toString())
                            .font(.custom(semiBoldFont, size: 16))
                            .foregroundStyle(selectedPriority == priority ? priority.primaryColor() : .primary)
                        Spacer()

                        
                    }
                    .padding(5)
                    .background(selectedPriority == priority ? priority.secondaryColor() : .white)
                    .cornerRadius(10)
                    .onTapGesture {
                        selectedPriority = priority
                        withAnimation(.snappy) {isExpandedP.toggle()}
                    }
                }
            }
            .padding()
            .background(.white)
            .cornerRadius(20)
            .frame(width: UIScreen.main.bounds.width - 50)
            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 2)
            .padding(.top, -10)
        }
        
    }
}


#Preview {
    PriorityPickerView(selectedPriority: .constant(.high))
}
