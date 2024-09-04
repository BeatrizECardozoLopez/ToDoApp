//
//  ForgotPasswordView.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 4/9/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    
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
                        Text("Reset Password")
                            .font(.custom(blackFont, size: 32))
                            .foregroundStyle(.primary)
                        Text("Please enter the email associated with your account")
                            .font(.custom(blackFont, size: 16))
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                }
                IconTextFieldView(title: "Email", icon: "envelope.fill", data: self.$userEmail, isSecureTextField: false)

                HStack {
                    Spacer()
                    Button{
                        //TODO: Reset password
                    } label: {
                        Text("Send")
                            .font(.custom(boldFont, size: 16))
                            .foregroundStyle(.primary)
                    }
                    .frame(width: 150)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("PrimaryColor"))
                    .cornerRadius(15)
                }
 
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
    ForgotPasswordView()
}
