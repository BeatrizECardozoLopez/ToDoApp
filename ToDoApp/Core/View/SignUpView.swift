//
//  SignUpView.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 4/9/24.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var userFullName: String = ""
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    @State private var userConfirmPassword: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isConfirmPasswordVisible: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack (alignment: .topLeading){
                    Ellipse()
                        .frame(width: 500, height: 378)
                        .padding(.leading, -150)
                        .padding(.top, -250)
                        .foregroundColor(Color("PrimaryColor"))
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 5)
                    Ellipse()
                        .frame(width: 400, height: 278)
                        .padding(.leading, -100)
                        .padding(.top, -200)
                        .foregroundColor(Color("SecondPrimaryColor"))
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 5)
                    Ellipse()
                        .frame(width: 300, height: 178)
                        .padding(.leading, -50)
                        .padding(.top, -150)
                        .foregroundColor(Color("ThirdPrimaryColor"))
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 5)
                    
                }
               VStack (alignment: .leading){
                        Text("Create Your Account")
                            .font(.custom(blackFont, size: 32))
                            .foregroundStyle(.primary)
                }
                VStack {
                    IconTextFieldView(title: "Full Name", icon: "person.fill", data: self.$userFullName, isSecureTextField: false)
                    IconTextFieldView(title: "Email", icon: "envelope.fill", data: self.$userEmail, isSecureTextField: false)
                    IconTextFieldView(title: "Password", icon: "lock.fill", data: self.$userPassword, visibleContent: self.isPasswordVisible, isSecureTextField: true)
                    IconTextFieldView(title: "Confirm Password", icon: "lock.fill", data: self.$userConfirmPassword, visibleContent: self.isConfirmPasswordVisible,isSecureTextField: true)
                }
                HStack {
                    Spacer()
                    Button{
                        //TODO: Create account
                    } label: {
                        Text("Sign Up")
                            .font(.custom(boldFont, size: 16))
                            .foregroundStyle(.primary)
                    }
                    .frame(width: 150)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("PrimaryColor"))
                    .cornerRadius(15)
                }
                HStack {
                    Spacer()
                    Text("Already have an account?")
                        .font(.custom(boldFont, size: 14))
                        .foregroundStyle(.secondary)
                    Text("Sign In")
                        .font(.custom(blackFont, size: 14))
                        .foregroundStyle(Color("PrimaryColor"))
                        .underline()
                    
                }
                .padding(.vertical, 16)
                Spacer()
                ZStack (alignment: .bottomLeading){
                    Ellipse()
                        .frame(width: 500, height: 378)
                        .padding(.leading, -300)
                        .padding(.bottom, -310)
                        .foregroundColor(Color("PrimaryColor"))
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 5)
                    Ellipse()
                        .frame(width: 400, height: 278)
                        .padding(.leading, -250)
                        .padding(.bottom, -250)
                        .foregroundColor(Color("SecondPrimaryColor"))
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 5)
                    Ellipse()
                        .frame(width: 300, height: 178)
                        .padding(.leading, -200)
                        .padding(.bottom, -200)
                        .foregroundColor(Color("ThirdPrimaryColor"))
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 5)
                }
            }
            .padding(32)
        }
    }
}

#Preview {
    SignUpView()
}
