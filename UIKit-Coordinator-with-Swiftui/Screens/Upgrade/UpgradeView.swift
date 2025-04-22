//
//  UpgradeScreen.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 19.04.2025.
//

import SwiftUI

struct UpgradeView: View {
    @State var viewModel: ViewModel
    var body: some View {
        
        VStack {
            Text("Would you like to upgrade your account?")
            
            Button("Upgrade Account"){
                viewModel.onCloseScreen()
            }
        }
    }
}

#Preview {
    UpgradeView(viewModel: .init())
}
