//
//  IconTextFieldView.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 3/9/24.
//

import SwiftUI
import SwiftData

struct IconTextFieldView: View {
    @State var title: String
    @State var icon: String
    @Binding var data: String

    var body: some View {
        HStack (alignment: .center, spacing: 24){
            Image(systemName: icon)
                .imageScale(.small)
                .foregroundStyle(Color("PrimaryColor"))
            
            VStack(alignment: .leading){
                Text(title)
                    .font(.custom(boldFont, size: 14))
                    .foregroundStyle(.secondary)
               
                TextField("", text: self.$data)
                    .font(.custom(regularFont, size: 14))
                    .foregroundStyle(.primary)
                    .autocapitalization(.none)
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .frame(width: UIScreen.main.bounds.width - 70)
        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 2)
        .padding(.vertical, 12)
    }
}

#Preview {
    IconTextFieldView(title: "Email Address", icon: "envelope.fill", data: .constant(""))
}
