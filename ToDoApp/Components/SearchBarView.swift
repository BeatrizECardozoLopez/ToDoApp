//
//  SearchBarView.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 1/9/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var text: String
    //Personalized Binding
//    private var searchText: Binding<String> {
//        Binding<String>(
//            get: {
//                self.text.capitalized
//            }, set: {
//                self.text = $0
//            }
//        )
//    }
    @State private var isEditing: Bool = false
    
    var body: some View {
        
        HStack {
            TextField("Search a task...", text:  self.$text)
                .font(.custom(boldFont, size: 14))
                .padding(8)
                .padding(.horizontal, 42)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .overlay(
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(self.isEditing ? Color("PrimaryColor") : .gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                            
                        
                        if self.isEditing {
                            Button {
                                self.text = ""
                            } label: {
                                Image(systemName: "multiply")
                                    .foregroundStyle(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 16)
                .onTapGesture {
                    withAnimation{
                        self.isEditing = true
                    }
                }
            
            if self.isEditing {
                Button {
                    self.isEditing = false
                    self.text = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                } label: {
                    Text("Cancel")
                        .font(.custom(boldFont, size: 14))
                        .foregroundStyle(Color("PrimaryColor"))
                }
                .padding(.trailing, 12)
                .transition(.move(edge: .trailing))
            }
        } 
    }
}

#Preview {
    SearchBarView(text: .constant(""))
}
