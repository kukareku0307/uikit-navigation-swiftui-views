//
//  RegisterView.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 15.04.2025.
//

import SwiftUI

struct RegisterView: View {
    @State var viewModel: ViewModel
    var body: some View {
        VStack{
            Spacer()
            
            EmailField(value: $viewModel.email)
            
            PasswordField(value: $viewModel.password)
            
            PasswordField(value: $viewModel.password)
            
            Button("Register"){
                viewModel.onRegisterTapped()
            }
            
            Spacer()
            
            Button("Login"){
                viewModel.onLoginTapped()
            }
        }
        .padding(.horizontal, 40)
        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert){
            Button("OK", role: .none){
                if viewModel.registrationSuccessful{
                    viewModel.onRegisterComplete()
                }
            }
        }
    }
}

