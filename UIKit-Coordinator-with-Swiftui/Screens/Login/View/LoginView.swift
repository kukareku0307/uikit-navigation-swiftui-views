//
//  LoginView.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 14.04.2025.
//

import SwiftUI

struct LoginView: View {
    
    @State var viewModel: ViewModel
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Text("Navigation")
                .padding(35)
            
            EmailField(value: $viewModel.email)
            
            PasswordField(value: $viewModel.password)
            
            Button(action: { viewModel.onLoginTapped()}){
                Text("Submit")
            }
            
            Spacer()
            
            Button(action: { viewModel.onRegisterTapped()}){
            Text("Register")
            }
            
        }
        .padding(.horizontal, 50)
    }
}

