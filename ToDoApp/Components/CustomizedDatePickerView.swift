//
//  CustomizedDatePickerView.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 30/8/24.
//

import SwiftUI

struct CustomizedDatePickerView: View {
    @Binding var selectedDate: Date
    @State private var showDatePicker: Bool = false
    
    var body: some View {
        
        HStack {
            Image(systemName: "calendar")
                .foregroundStyle(Color("PrimaryColor"))
                .font(.system(size: 16))
                .padding(.vertical, 10)
                .padding(.horizontal, 8)
            
            VStack (alignment: .leading) {
                Text("Date")
                    .font(.custom(boldFont, size: 14))
                    .foregroundStyle(.secondary)
                
            }
            
            Spacer()
            
            DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                .font(.custom(boldFont, size: 26))
                .foregroundStyle(.primary)
                .background(.clear)
                .labelsHidden()
                .accentColor(Color("PrimaryColor"))
           // .padding(.horizontal)
            
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .frame(width: UIScreen.main.bounds.width - 50)
        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 2)
//        .onTapGesture {
//            withAnimation(.snappy) {showDatePicker.toggle()}
//        }
        .padding(.vertical, 12)

//        if showDatePicker {
//            VStack {
//                DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
//                            .labelsHidden()
//               
//            }
//            .padding()
//            .background(.white)
//            .cornerRadius(20)
//            .frame(width: UIScreen.main.bounds.width - 50)
//            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 2)
//            .padding(.top, -10)
//        }
    }
    
    private var dateFormatter: DateFormatter {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            return dateFormatter
    }
}


#Preview {
    CustomizedDatePickerView(selectedDate: .constant(Date()))
}
