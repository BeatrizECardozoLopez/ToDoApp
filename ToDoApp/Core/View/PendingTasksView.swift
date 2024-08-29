//
//  TodayTasksView.swift
//  ToDoAppUI
//
//  Created by Beatriz Cardozo on 28/8/24.
//

import SwiftUI
import SwiftData

struct PendingTasksView: View {
    
    @State var tasks: [Task] = []
    
    //MARK: Create new task
    @State private var newTaskTitle: String = ""
    @State private var newTaskPriority: Priority = .normal
    @State private var newTaskCategory: Category = .personal
    
    @State private var showNewTask = false
    
    var body: some View {
        
        ZStack {
            VStack {
                HStack{
                    Text("Today's Tasks")
                        .font(.system(size: 30, design: .rounded))
                        .fontWeight(.black)
                    
                    Spacer()
                    
                    Button{
                        self.showNewTask = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.title)
                            .foregroundStyle(Color("PrimaryColor"))
                    }
                } 
                .padding()
                
                List{
                    ForEach(self.tasks){ task in
                        //TODO: TaskTile
                    }
                }
                .listStyle(.plain)
                .rotation3DEffect(
                    Angle(degrees: self.showNewTask ? 8 : 0), axis: (x: 1, y: 0, z: 0))
                .offset(y: self.showNewTask ? -40 : 0)
                .animation(.easeInOut, value: self.showNewTask)
                .onAppear{
                    UITableView.appearance().separatorColor = .clear
                }
                
                if self.tasks.count == 0 {
                    //TODO: Create an empty view "No tasks for today"
                }
                
                if self.showNewTask {
                    //TODO: Create form to create new task
                }
            }
            
            
        }
        
    }
}

#Preview {
    PendingTasksView()
}
