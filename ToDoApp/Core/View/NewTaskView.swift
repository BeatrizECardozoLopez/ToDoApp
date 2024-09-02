//
//  AddProjectView.swift
//  ToDoAppUI
//
//  Created by Beatriz Cardozo on 28/8/24.
//

import SwiftUI
import SwiftData

struct NewTaskView: View {
    
    //MARK: Task fields
    @State var title: String = ""
    @State var description: String = ""
    @State var selectedPriority: Priority = .normal
    @State var selectedCategory: Category = .office
    @State var selectedDate: Date = Date()
    @State var selectedTime: Date = Date()
    @State private var horaSeleccionada = Date()
    @State private var horaAislada: Date = Date()
    
    //MARK: Alert Variable
    @State var showAlert: Bool = false
    @State var taskCreatedSuccessfully: Bool = false
    
    //MARK: Swift Data modelContext to add task
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        ScrollView (showsIndicators: false){
            VStack {
                NewTaskBar()
                TaskGroupPickerView(selectedCategory: self.$selectedCategory)
                PriorityPickerView(selectedPriority: self.$selectedPriority)
                CustomizedDatePickerView(selectedDate: self.$selectedDate)
                CustomizedTimePickerView(scheduledTime: self.$horaSeleccionada)
                TextFieldView(title: "Task Title", data: self.$title, isMultiLine: false)
                TextFieldView(title: "Description", data: self.$description, isMultiLine: true)
                
                Button{
                    if self.title.trimmingCharacters(in: .whitespacesAndNewlines) == "" && self.description.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                        self.showFailureAlert()
                    } else {
                        let taskCreationResult = self.addNewTask(title: self.title, taskDescription: self.description, priority: self.selectedPriority, category: self.selectedCategory, date: self.selectedDate, hour: self.extraerHoraAislada(from: horaSeleccionada))
                        if taskCreationResult {
                            self.showSuccessAlert()
                            self.resetFormValues()
                        } else {
                            self.showFailureAlert()
                        }
                    }
                } label: {
                    Text("Create")
                        .font(.custom(boldFont, size: 16))
                        .foregroundStyle(.primary)
                }
                .frame(width: 150)
                .foregroundColor(.white)
                .padding()
                .background(Color("PrimaryColor"))
                .cornerRadius(15)
                .padding(.horizontal, 20)
                .padding(.vertical, 24)
                .alert(isPresented: $showAlert) {
                    if taskCreatedSuccessfully {
                        return Alert(title: Text("Task Created Successfully"), message: Text(""), dismissButton: .default(Text("Let's go!")))
                    } else {
                         return Alert(title: Text("Task Creation Failed"), message: Text(""), dismissButton: .default(Text("Oh no!")))
                     }
                }
                Spacer()
            }
            .padding(.bottom, 32)
        }
    }
    
    private func addNewTask(title: String, taskDescription: String, priority: Priority, category: Category, date: Date, hour: Date, isCompleted: Bool = false) -> Bool {
        let task = Task(title: title, taskDescription: taskDescription, priority: priority, category: category, date: date, time: hour, isCompleted: isCompleted)
        do {
            try modelContext.insert(task)
            return true
        } catch {
            return false
        }
    }
    
    func extraerHoraAislada(from fecha: Date) -> Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: fecha)
        let newDate = calendar.date(bySettingHour: components.hour ?? 0, minute: components.minute ?? 0, second: 0, of: Date()) ?? Date()
        return newDate
    }
    
    func showSuccessAlert() {
        self.showAlert = true
        self.taskCreatedSuccessfully = true
    }

    func showFailureAlert() {
        self.showAlert = true
        self.taskCreatedSuccessfully = false
    }

    func resetFormValues() {
        self.title = ""
        self.selectedCategory = .office
        self.description = ""
        self.selectedPriority = .normal
        self.selectedDate = Date()
        self.selectedTime = Date()
    }
    
    struct NewTaskBar: View {
        var body: some View {
            HStack {
                Spacer()
                Text("Add Task")
                    .font(.custom(boldFont, size: 25))
                    .foregroundStyle(.primary)
                Spacer()
            }
            .padding()
        }
    }
    
    struct TaskGroupPickerView: View {
        @Binding var selectedCategory: Category
        @State private var isExpanded: Bool = false
        
        var body: some View {
            
            HStack {
                Image(systemName: selectedCategory.iconImageName())
                    .foregroundStyle(selectedCategory.primaryColor())
                    .font(.system(size: 16))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 8)
                    .background(selectedCategory.secondaryColor())
                    .cornerRadius(10)
                
                VStack (alignment: .leading) {
                    Text("Task Group")
                        .font(.custom(boldFont, size: 14))
                        .foregroundStyle(.secondary)
                    
                    Text(selectedCategory.toString())
                        .font(.custom(boldFont, size: 16))
                }
                .padding(.horizontal)
                
                Spacer()
                
                Image("caret-down-solid")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 15, height: 15)
                    .rotationEffect(.degrees(isExpanded ? -180 : 0))
            }
            .padding()
            .background(.white)
            .cornerRadius(20)
            .frame(width: UIScreen.main.bounds.width - 50)
            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 2)
            .onTapGesture {
                withAnimation(.snappy) {isExpanded.toggle()}
            }
            .padding(.vertical, 12)
            
            if isExpanded {
                VStack {
                    ForEach(Category.allCases, id: \.self) { category in
                        HStack {
                            Text(category.toString())
                                .font(.custom(semiBoldFont, size: 16))
                                .foregroundStyle(selectedCategory == category ? category.primaryColor() : .primary)
                            Spacer()
                            Image(systemName: category.iconImageName())
                                .foregroundColor(category.primaryColor())
                            
                        }
                        .padding(5)
                        .background(selectedCategory == category ? category.secondaryColor() : .white)
                        .cornerRadius(10)
                        .onTapGesture {
                            selectedCategory = category
                            withAnimation(.snappy) {isExpanded.toggle()}
                        }
                    }
                }
                .padding()
                .background(.white)
                .cornerRadius(20)
                .frame(width: UIScreen.main.bounds.width - 50, height: 150)
                .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 2)
                .padding(.top, -10)
            }
            
        }
    }
}
    
#Preview {
    NewTaskView()
}


