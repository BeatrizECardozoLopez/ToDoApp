//
//  ProfileView.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 30/8/24.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    
    var fullName: String = "Jane Doe" //Provisional
    
    var body: some View {
    
        VStack (alignment: .center) {
            HStack{
                Spacer()
                Text("Your Profile")
                    .font(.custom(boldFont, size: 25))
                    .foregroundStyle(.primary)
                Spacer()
            }
            .padding(.vertical)
            
            HStack (spacing: 24){
//                Image("profilePictureTest")
//                    .resizable()
//                    .scaledToFit()
//                    .clipShape(Circle())
//                    .frame(width: 70, height: 70)
//                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                Text(initials)
                    .font(.custom(boldFont, size: 32))
                    .foregroundStyle(Color("PrimaryColor"))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 72, height: 72)
                    .background(.white)
                    .clipShape(Circle())

                VStack (alignment: .leading, spacing: 8){
                    Text("Jane Doe")
                        .font(.custom(boldFont, size: 16))
                        .foregroundStyle(.white)
                    Text("@janedoe1974")
                        .font(.custom(lightFont, size: 16))
                        .foregroundStyle(.white)
                }
                Spacer()
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 20)
            .background(Color("PrimaryColor"))
            .cornerRadius(10)
            .frame(width: UIScreen.main.bounds.width - 50, height: 100)
            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 2)
            
            
            List{
                Section ("General"){
                    HStack{
                        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
                
                Section ("Personal Details"){
                    //User Country
                    HStack{
                        SettingsRowView(imageName: "mappin.and.ellipse", title: "Country", tintColor: Color(.systemGray))
                        Spacer()
                        Text("United States")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    
                    //User Phone Number
                    HStack{
                        SettingsRowView(imageName: "phone.fill", title: "Phone Number", tintColor: Color(.systemGray))
                        Spacer()
                        Text("(555) 123-4567")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    
                    //User Gender
                    HStack{
                        SettingsRowView(imageName: "figure.stand", title: "Gender", tintColor: Color(.systemGray))
                        Spacer()
                        Text("Female")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
                
                
                Section ("Account"){
                    
                    //Edit Personal Details Button
                    Button {
                    } label : {
                        SettingsRowView(imageName: "pencil", title: "Edit Personal Details", tintColor: .secondary)
                    }
                    
                    //Sign Out Button
                    Button {
//                        Task {
//                            viewModel.signOut()
//                        }
                    } label : {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red)
                    }
                    
                    //Delete Account Button
                    Button {
//                        Task {
//                            viewModel.deactivateAccount()
//                        }
                    } label : {
                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                    }
                }
            }
            
            Spacer()
        }
        
    }
    
    //If there is no profile picture
    var initials: String {
        let formatter = PersonNameComponentsFormatter() //-> this object is gonna get us what we need
        if let components = formatter.personNameComponents(from: fullName){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return "" //In a real app we might want to retun an image
    }
}

#Preview {
    ProfileView()
}
