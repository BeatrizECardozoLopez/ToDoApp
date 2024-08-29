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
                        .font(.custom(boldFont, size: 30))
                        .foregroundStyle(.primary)
                    
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
                        PendingTaskTileView(task: task)
                    }
                    .listRowSeparator(.hidden)
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
                    NoTasksView()
                    Spacer()
                }
                
                if self.showNewTask {
                    //TODO: Create form to create new task
                }
                
                
            }
            
            
        }
        
    }
}

//MARK: No Tasks View
struct NoTasksView: View {
    var body: some View {
        VStack{
            Text("You've no tasks for today!")
                .font(.custom(boldFont, size: 16))
                .foregroundStyle(.secondary)
                .padding()
            Image("NoTasksImage")
                .resizable()
                .scaledToFill()
            Spacer()
        }
    }
}

#Preview {
    PendingTasksView()
}
