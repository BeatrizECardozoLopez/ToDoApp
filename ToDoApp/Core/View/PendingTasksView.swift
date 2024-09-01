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
    @State private var searchText: String = ""
    
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
                
                SearchBarView(text: self.$searchText)
                
                List{
                    ForEach(self.tasks.filter({self.searchText.isEmpty ? true: $0.title.contains(self.searchText)})){ task in
                        PendingTaskTileView(task: task)
                    }
                    .onDelete(perform: { indexSet in
                        self.deleteTask(indexSet: indexSet)
                    })
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
