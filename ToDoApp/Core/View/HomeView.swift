//
//  HomeView.swift
//  ToDoAppUI
//
//  Created by Beatriz Cardozo on 28/8/24.
//

import SwiftUI

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
    
 var body: some View {

     ScrollView {
         VStack{
             TopBar()
             HomeBoardView()
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
                Text("Livia Vaccaro")
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
    var body: some View {

        VStack {
            HStack {
                homeTitle(title: "In Progress")
                Spacer()
            }
            .padding(.horizontal, 32)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack (spacing: 30){
                    ProgressCardView(category: "Office Project", taskTitle: "Grocery shopping app design", icon: "briefcase.fill", primaryColor: Color("OfficePrimaryColor"), secondaryColor: Color("OfficeSecondaryColor"), completedPercentage: 0.7)
                    
                    ProgressCardView(category: "Personal Project", taskTitle: "Uber Eats redesign challenge", icon: "person.circle.fill", primaryColor: Color("PersonalPrimaryColor"), secondaryColor: Color("PersonalSecondaryColor"), completedPercentage: 0.2)
                    
                    ProgressCardView(category: "Daily Study", taskTitle: "Study for Linear Algebra Test", icon: "book.pages.fill", primaryColor: Color("StudyPrimaryColor"), secondaryColor: Color("StudySecondaryColor"), completedPercentage: 0.87)
                }
                .padding(.horizontal, 32)
            }
        }


    }
}

//MARK: Task Groups Design
struct TaskGroup: View {
    var body: some View {
        VStack {
            HStack {
                homeTitle(title: "Task Groups")
                Spacer()
            }
            .padding(.horizontal, 16)

            TaskGroupTilesView(category: "Office Project", icon: "briefcase.fill", primaryColor: Color("OfficePrimaryColor"), secondaryColor: Color("OfficeSecondaryColor"), completedPercentage: 0.7, totalTasks: "23 Tasks")
            
            TaskGroupTilesView(category: "Personal Project", icon: "person.circle.fill", primaryColor: Color("PersonalPrimaryColor"), secondaryColor: Color("PersonalSecondaryColor"), completedPercentage: 0.52, totalTasks: "30 Tasks")
            
            TaskGroupTilesView(category: "Daily Study", icon: "book.pages.fill", primaryColor: Color("StudyPrimaryColor"), secondaryColor: Color("StudySecondaryColor"), completedPercentage: 0.87, totalTasks: "30 Tasks")
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




#Preview {
    HomeView()
}
