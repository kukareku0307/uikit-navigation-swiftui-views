//
//  AccountView.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 16.04.2025.
//

import SwiftUI

private enum Constants {
    static let avatarBackgroundSize: CGFloat = 70
    static var avatarSize: CGFloat { avatarBackgroundSize * 0.5}
}

struct AccountView: View {
    
    @State var viewModel: ViewModel
    
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    //Avatar Image
                    ZStack{
                        Circle()
                            .foregroundStyle(.gray.opacity(0.5))
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: Constants.avatarSize, height: Constants.avatarSize)
                    }
                    .frame(width: Constants.avatarBackgroundSize, height: Constants.avatarBackgroundSize)
                    
                    Text("John Smith")
                        .font(.headline)
                        .padding()
                    
                    Spacer()
                        .frame(height: 100)
                    
                    ListRow(title: "Email", trailing: "john@example.com")
                    
                }
                
            }
            .padding(.top, 20)
            
            Button("Edit Account"){
                viewModel.onEditTapped()
            }
            .padding(.bottom, 10)
            
            Button("Logout"){
                viewModel.onLogoutTapped()
            }
            .padding(.bottom, 10)
            
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AccountView(viewModel: .init())
}
