//
//  PasswordField.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 15.04.2025.
//

import SwiftUI

struct PasswordField: View {
    
    @Binding var value: String
    var placeholder: String = "Password"
    
    
    var body: some View {
        VStack{
            SecureField(placeholder, text: $value)
                .textFieldStyle(DefaultTextFieldStyle())
        }
    }
}

#Preview {
    PasswordField(value:.constant("2"))
}
