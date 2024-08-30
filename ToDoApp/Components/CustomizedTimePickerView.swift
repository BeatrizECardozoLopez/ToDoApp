//
//  CustomizedTimePickerView.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 30/8/24.
//

import SwiftUI

struct CustomizedTimePickerView: View {
    @Binding var selectedHour: Date
    @State private var showDatePicker: Bool = false
    
    var body: some View {
        
        HStack {
            Image(systemName: "clock.fill")
                .foregroundStyle(Color("PrimaryColor"))
                .font(.system(size: 16))
                .padding(.vertical, 10)
                .padding(.horizontal, 8)
            
            VStack (alignment: .leading) {
                Text("Hour")
                    .font(.custom(boldFont, size: 14))
                    .foregroundStyle(.secondary)
                
            }
            
            Spacer()
            
            DatePicker("Select a date", selection: $selectedHour, displayedComponents: .hourAndMinute)
                .font(.custom(boldFont, size: 26))
                .foregroundStyle(.primary)
                .background(.clear)
                .labelsHidden()
                .accentColor(Color("PrimaryColor"))
            
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .frame(width: UIScreen.main.bounds.width - 50)
        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 2)
        .padding(.vertical, 12)
    }
    
    private var dateFormatter: DateFormatter {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            return dateFormatter
    }
}

#Preview {
    CustomizedTimePickerView(selectedHour: .constant(Date()))
}
