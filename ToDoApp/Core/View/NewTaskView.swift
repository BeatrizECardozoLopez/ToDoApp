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
    @State var title: String
    @State var priority: Priority
    @State var category: Category
    @State var isEditing = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NewTaskView(/*isShow: .constant(true),*/ tasks: .constant([]), title: "", priority: .normal, category: .personal)
}
