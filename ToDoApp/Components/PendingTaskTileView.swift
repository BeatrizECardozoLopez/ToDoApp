//
//  PendingTaskTileView.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 28/8/24.
//

import SwiftUI
import SwiftData

struct PendingTaskTileView: View {
    
    @State var task: Task
    
    var body: some View {
        
        HStack {
            VStack (alignment: .leading, spacing: 10){
                Text(task.category.toString())
                    .font(.custom(boldFont, size: 12))
                    .foregroundStyle(.secondary)
                
                Text(task.title)
                    .font(.custom(semiBoldFont, size: 18))
                    .foregroundStyle(self.task.isCompleted ? .secondary : .primary)
                    .strikethrough(self.task.isCompleted, color: Color("PrimaryColor"))
                    .animation(.default)
                
                HStack{
                    Image(systemName: "calendar")
                    Text(dateFormatter.string(from: self.task.date))
                        .font(.custom(boldFont, size: 12))
                    
                    
                    Text(task.isCompleted ? "Done" : task.priority.toString())
                        .foregroundStyle(task.isCompleted ? .white : self.task.isCompleted ? .secondary :task.priority.primaryColor())
                        .font(.custom(blackFont, size: 10))
                        .padding(5)
                        .background(task.isCompleted ? .green : self.task.isCompleted ? Color(.lightGray) :task.priority.secondaryColor())
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                .foregroundStyle(self.task.isCompleted ? .secondary : Color("PrimaryColor"))
                .animation(.default)
                
            }
            .padding(.vertical, 5)
            
            Spacer()
            
            
            VStack (spacing: 22){
                Image(systemName: task.category.iconImageName())
                    .foregroundStyle(self.task.isCompleted ? .secondary : task.category.primaryColor())
                    .font(.system(size: 12))
                    .frame(width: 15, height: 10)
                    .padding(.vertical, 15)
                    .padding(.horizontal, 12)
                    .background(self.task.isCompleted ? Color(.lightGray) : task.category.secondaryColor())
                    .cornerRadius(20)
                    .animation(.default)
                Toggle(isOn: self.$task.isCompleted) {}
                    .toggleStyle(CheckboxStyle())
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(.white)
        .cornerRadius(15)
        .frame(width: UIScreen.main.bounds.width - 50, height: 100)
        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 2)
    }
    
    private var dateFormatter: DateFormatter {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            return dateFormatter
    }
}

//MARK: CheckBox Style
struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle" : "circle")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(Color("PrimaryColor"))
                .onTapGesture { configuration.isOn.toggle() }
            configuration.label
        }
    }
}

#Preview {
    PendingTaskTileView(task: Task(title: "Market Research", priority: .low,category: .office))
}


