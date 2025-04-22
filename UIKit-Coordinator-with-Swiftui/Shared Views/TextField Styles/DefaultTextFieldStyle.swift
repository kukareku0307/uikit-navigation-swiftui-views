//
//  DefaultTextFieldStyle.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 14.04.2025.
//

import SwiftUI

struct DefaultTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding(.horizontal, 5)
            .padding(.vertical, 10)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .overlay{
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.black, lineWidth: 1)
            }
            
    }
    
}

#Preview{
    VStack{
        TextField("Test", text: .constant(""))
            .textFieldStyle(DefaultTextFieldStyle())
    }
    
}
