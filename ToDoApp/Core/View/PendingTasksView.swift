//
//  TodayTasksView.swift
//  ToDoAppUI
//
//  Created by Beatriz Cardozo on 28/8/24.
//

import SwiftUI
import SwiftData

struct PendingTasksView: View {
    
    //@Query(sort: \Task.priorityNum) private var tasks: [Task] //Ordenado por prioridad, primero low
    @Query(sort: \Task.priorityNum, order: .reverse) private var tasks: [Task] //Ordenado por prioridad, primero high
    
    @Environment(\.modelContext) private var modelContext //Swift Data
    
    //MARK: Create new task
    @State private var newTaskTitle: String = ""
    @State private var newTaskPriority: Priority = .normal
    @State private var newTaskCategory: Category = .personal
    
    var body: some View {
        
        ZStack {
            VStack {
                HStack{
                    Spacer()
                    Text("Tasks")
                        .font(.custom(boldFont, size: 30))
                        .foregroundStyle(.primary)
                    Spacer()
                    
                } 
                .padding()
                
                List{
                    ForEach(self.tasks){ task in
                        PendingTaskTileView(task: task)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .onAppear{
                    UITableView.appearance().separatorColor = .clear
                }
                
                if self.tasks.count == 0 {
                    NoTasksView()
                }
            }
            
            
        }
        
    }
    
    private func deleteTask(indexSet: IndexSet) {
        for index in indexSet {
            let taskToDelete = self.tasks[index]
            self.modelContext.delete(taskToDelete)
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
