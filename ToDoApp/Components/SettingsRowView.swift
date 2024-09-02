//
//  SettingsRowView.swift
//  ToDoApp
//
//  Created by Beatriz Cardozo on 1/9/24.
//

import SwiftUI

struct SettingsRowView: View {
    
    let imageName: String
    let title: String
    var iconColor: Color = Color("PrimaryColor")
    var backgroundColor: Color = Color("LightPrimaryColor")
    
    
    var body: some View {
        
        HStack (spacing: 12){
            Image(systemName: imageName)
                .foregroundStyle(iconColor)
                .font(.system(size: 18))
                .frame(width: 15, height: 10)
                .padding(.vertical, 15)
                .padding(.horizontal, 12)
                .background(backgroundColor)
                .cornerRadius(20)
            
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.black)
        }
        
    }
}

#Preview {
    SettingsRowView(imageName: "gear", title: "Version")
}
