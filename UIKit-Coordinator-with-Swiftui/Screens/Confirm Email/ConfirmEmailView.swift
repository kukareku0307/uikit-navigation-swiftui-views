//
//  ConfirmEmailView.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 18.04.2025.
//

import SwiftUI

struct ConfirmEmailView: View {
    
    @State var viewModel: ViewModel
    var body: some View {
        VStack{
            Text("Confrim Email")
            
            TextField("", text: $viewModel.emailCode)
                .multilineTextAlignment(.center)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                    
                }
                .frame(width: 100)
            
            Button("Submit"){
                viewModel.showSubmittedAler = true
            }
            .padding(.top, 30)
            
            
        }
        .navigationBarBackButtonHidden()
        .alert("Code Submitted", isPresented: $viewModel.showSubmittedAler){
                Button("OK"){
                    viewModel.onConfirmEmailSubmitted()
                }
            }
    }
}

