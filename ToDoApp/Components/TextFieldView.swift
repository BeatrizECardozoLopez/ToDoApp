//
//  TextFieldView.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 28/8/24.
//

import SwiftUI
import SwiftData

struct TextFieldView: View {
    @State var title: String
    @Binding var data: String
    var isMultiLine: Bool
    

    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(title)
                    .font(.custom(boldFont, size: 14))
                    .foregroundStyle(.secondary)
               
              if isMultiLine {
                  TextField("", text: self.$data, axis: .vertical)
                      .font(.custom(boldFont, size: 16))
                      .foregroundStyle(.primary)
                      .lineLimit(3...5)
              } else {
                   TextField("", text: self.$data)
                      .font(.custom(boldFont, size: 18))
                      .foregroundStyle(.primary)
              }
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .frame(width: UIScreen.main.bounds.width - 50)
        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 2)
        .padding(.vertical, 12)
    }
}

#Preview {
    TextFieldView(title: "Title", data: .constant(""), isMultiLine: false)
}
