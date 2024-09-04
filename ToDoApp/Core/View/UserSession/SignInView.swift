//
//  SignInView.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 3/9/24.
//

import SwiftUI

struct SignInView: View {
    
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack (alignment: .topLeading){
                    Ellipse()
                        .frame(width: 500, height: 378)
                        .padding(.leading, 300)
                        .padding(.top, -250)
                        .foregroundColor(Color("PrimaryColor"))
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 5)
                    Ellipse()
                        .frame(width: 400, height: 278)
                        .padding(.leading, 350)
                        .padding(.top, -200)
                        .foregroundColor(Color("SecondPrimaryColor"))
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 5)
                    Ellipse()
                        .frame(width: 300, height: 178)
                        .padding(.leading, 400)
                        .padding(.top, -150)
                        .foregroundColor(Color("ThirdPrimaryColor"))
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 5)
                    
                }
                HStack {
                    VStack (alignment: .leading, spacing: 16){
                        Text("Login")
                            .font(.custom(blackFont, size: 32))
                            .foregroundStyle(.primary)
                        Text("Please sign in to continue.")
                            .font(.custom(blackFont, size: 16))
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                }
                VStack {
                    IconTextFieldView(title: "Email", icon: "envelope.fill", data: self.$userEmail, isSecureTextField: false)
                    
                    IconTextFieldView(title: "Password", icon: "lock.fill", data: self.$userPassword, isSecureTextField: true)
                }
                HStack {
                    Spacer()
                    NavigationLink(destination: ForgotPasswordView()){
                        Text("Forgot password?")
                            .font(.custom(blackFont, size: 14))
                            .foregroundStyle(Color("PrimaryColor"))
                    }
                }
                .padding(.bottom, 32)
                HStack {
                    Spacer()
                    Button{
                        //TODO: Create account
                    } label: {
                        Text("Sign In")
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
                    Text("Not registered yet?")
                        .font(.custom(boldFont, size: 14))
                        .foregroundStyle(.secondary)
                    NavigationLink(destination: SignUpView()){
                        Text("Create an account")
                            .font(.custom(blackFont, size: 14))
                            .foregroundStyle(Color("PrimaryColor"))
                            .underline()
                    }
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
    SignInView()
}
