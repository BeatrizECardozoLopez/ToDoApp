//
//  HomeView.swift
//  ToDoAppUI
//
//  Created by Beatriz Cardozo on 28/8/24.
//

import SwiftUI
import SwiftData

//MARK: Font Variables
let regularFont = "Mulish-Regular"
let blackFont = "Mulish-Black"
let boldFont = "Mulish-Bold"
let semiBoldFont = "Mulish-SemiBold"
let extraBoldFont = "Mulish-ExtraBold"
let lightFont = "Mulish-Light"
let mediumFont = "Mulish-Medium"
let extraLightFont = "Mulish-ExtraLight"

struct HomeView: View {
    //Read Tasks form Swift Data
    @Query(sort: \Task.priorityNum, order: .reverse) private var tasks: [Task]
    
 var body: some View {

     ScrollView {
         VStack{
             TopBar()
             HomeBoardView(totalCompletedPercentage: percentageCompletedTasks(inTasks: tasks))
                 .padding(.vertical)
             inProgress()
             TaskGroup()
         }
         .padding(.bottom, 32)
     }
 }
}

//MARK: Top Bar design
struct TopBar: View {
    var body: some View {
        HStack (spacing: 8){
            //Profile Picture
            Image("profilePictureTest")
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            //Welcome Text
            VStack(alignment: .leading, spacing: 4){
                Text("Hello!")
                    .font(.custom(semiBoldFont, size: 18))
                    .foregroundStyle(.secondary)
                Text("Beatriz Cardozo")
                    .font(.custom(boldFont, size: 21))
                    .kerning(0.5)
            }
            Spacer()
            Image(systemName: "bell.fill")
                .imageScale(.large)
        }
        .padding(.horizontal, 24)

    }
}


//MARK: In Progress Design
struct inProgress: View {
    //Read Tasks form Swift Data
    @Query(sort: \Task.priorityNum, order: .reverse) private var tasks: [Task]
    var body: some View {
        VStack {
            HStack {
                homeTitle(title: "In Progress")
                Spacer()
            }
            .padding(.horizontal, 32)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack (spacing: 30){
                    ForEach(self.tasks.filter { !$0.isCompleted }) { task in
                        ProgressCardView(category: task.category, taskTitle: task.title, icon: task.category.iconImageName(), primaryColor: task.category.primaryColor(), secondaryColor: task.category.secondaryColor())
                    }
                    
                    if !tasks.contains(where: { !$0.isCompleted }) {
                        NoInProgressTasksView()
                    }
                }
                .padding(.horizontal, 32)
            }
        }


    }
}

//MARK: No In Progress Design
struct NoInProgressTasksView: View {
    var body: some View {
        HStack{
            Text("Stay ahead, no tasks in progress!")
                .font(.custom(semiBoldFont, size: 12))
                .foregroundStyle(.secondary)
            Spacer()
        }
    }
}

//MARK: Task Groups Design
struct TaskGroup: View {
    //Read Tasks form Swift Data
    @Query(sort: \Task.priorityNum, order: .reverse) private var tasks: [Task]
    
    
    
    var body: some View {
        VStack {
            HStack {
                homeTitle(title: "Task Groups")
                Spacer()
            }
            .padding(.horizontal, 16)

            TaskGroupTilesView(category: "Office Project", icon: "briefcase.fill", primaryColor: Color("OfficePrimaryColor"), secondaryColor: Color("OfficeSecondaryColor"), completedPercentage: percentageCompletedTasksforCategory(forCategory: .office, inTasks: self.tasks), totalTasks: "\(totalTasksforCategory(forCategory: .office, inTasks: tasks)) Tasks")
            
            TaskGroupTilesView(category: "Personal Project", icon: "person.circle.fill", primaryColor: Color("PersonalPrimaryColor"), secondaryColor: Color("PersonalSecondaryColor"), completedPercentage: percentageCompletedTasksforCategory(forCategory: .personal, inTasks: self.tasks), totalTasks: "\(totalTasksforCategory(forCategory: .personal, inTasks: tasks)) Tasks")
            
            TaskGroupTilesView(category: "Daily Study", icon: "book.pages.fill", primaryColor: Color("StudyPrimaryColor"), secondaryColor: Color("StudySecondaryColor"), completedPercentage: percentageCompletedTasksforCategory(forCategory: .study, inTasks: self.tasks), totalTasks: "\(totalTasksforCategory(forCategory: .study, inTasks: tasks)) Tasks")
        }
        .padding()
    }
}

struct homeTitle: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.custom(boldFont, size: 22))
            .foregroundStyle(.primary)
    }
}

func percentageCompletedTasks(inTasks tasks: [Task]) -> Double {
    let completedTasks = tasks.filter { $0.isCompleted }
    if completedTasks.isEmpty {
        return 0.0
    } else {
        return Double(completedTasks.count) / Double(tasks.count) * 100.0
    }
}


func totalTasksforCategory(forCategory category: Category, inTasks tasks: [Task]) -> Int {
    let tasksForCategory = tasks.filter { $0.category == category }
    if tasksForCategory.isEmpty {
        return 0
    } else {
        return tasksForCategory.count
    }
}

func percentageCompletedTasksforCategory(forCategory category: Category, inTasks tasks: [Task]) -> Double {
    let tasksForCategory = tasks.filter { $0.category == category }
    let completedTasks = tasksForCategory.filter { $0.isCompleted }
    if tasksForCategory.isEmpty {
        return 0.0
    } else {
        return Double(completedTasks.count) / Double(tasksForCategory.count) * 100.0
    }
}


#Preview {
    HomeView()
}
