//
//  TaskDetailView.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 1/9/24.
//

import SwiftUI

struct TaskDetailView: View {
    var task: Task
    
    var body: some View {
        VStack {
            //Priority
            VStack{
                Text(task.isCompleted ? "Done" : task.priority.toString())
                    .font(.custom(semiBoldFont, size: 16))
                    .foregroundStyle(task.isCompleted ? .white : task.priority.primaryColor())
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .padding(5)
                    .background(task.isCompleted ? .green : task.priority.secondaryColor())
                    .cornerRadius(10)
            }
            .padding(.vertical)
            
            HStack{
                VStack (alignment: .center, spacing: 18){
                    Text(task.title)
                        .font(.custom(blackFont, size: 30))
                    .foregroundStyle(.primary)
                    
                    HStack {
                        Text(task.category.toString())
                            .font(.custom(semiBoldFont, size: 16))
                            .foregroundStyle(task.category.primaryColor())
                        Image(systemName: task.category.iconImageName())
                            .foregroundStyle(task.category.primaryColor())
                    }
                    .padding(5)
                    .background(task.category.secondaryColor())
                    .cornerRadius(10)
                    
                    HStack {
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundStyle(task.category.primaryColor())
                            Text(dateFormatter.string(from: self.task.date))
                                .font(.custom(semiBoldFont, size: 16))
                                .foregroundStyle(task.category.primaryColor())
                        }
                        Spacer()
                        HStack {
                            Image(systemName: "clock.fill")
                                .foregroundStyle(task.category.primaryColor())
                            Text(formatHourToString(date: self.task.time))
                                .font(.custom(semiBoldFont, size: 16))
                                .foregroundStyle(task.category.primaryColor())
                        }
                    }
                    .padding()
                    
                }
                Spacer()
            }
            .padding(.horizontal, 24)
            
            
            HStack {
                Text("Task Details: ")
                    .font(.custom(boldFont, size: 12))
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            Text(task.taskDescription)
                .font(.custom(regularFont, size: 12))
                .padding(.horizontal)
            
            Spacer()
        }
    }
    private var dateFormatter: DateFormatter {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            return dateFormatter
    }
    
    func formatHourToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: date)
    }
    
}


#Preview {
    TaskDetailView(task: Task(title: "Task 1", taskDescription: "Stuff and more Stuff"))
}
