//
//  EditAccountView.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 17.04.2025.
//

import SwiftUI

private enum Constants {
    static let labelPadding = EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
}

struct EditAccountView: View {
    
    @State var viewModel: ViewModel
    
    var body: some View {
        VStack{
            LabelledInputView(label: "Name", value : $viewModel.name)
                .padding(Constants.labelPadding)
            
            LabelledInputView(
                label: "Email",
                value : $viewModel.email,
                contentType: .emailAddress,
                autoCapitalization: .never
            )
                .padding(Constants.labelPadding)
            
            Button("Submit"){
                viewModel.onSubmitTapped()
            }
            .padding(.top, 20)
        }
        .navigationBarBackButtonHidden()
    }
}

// MARK: - LabelledInputVIew

private extension EditAccountView {
    
    struct LabelledInputView: View {
        var label: String
        @Binding var value: String
        var placeHolder: String = ""
        var contentType: UITextContentType?
        var autoCapitalization: TextInputAutocapitalization?
        
        
        var body: some View {
            VStack() {
               Text(label)
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField(placeHolder, text: $value)
                    .textContentType(contentType)
                    .textInputAutocapitalization(autoCapitalization)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    }
            }
        }
    }
}

#Preview {
    EditAccountView(viewModel: .init())
}
