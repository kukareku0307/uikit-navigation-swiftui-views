//
//  EditAccountViewModel.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 17.04.2025.
//

import Foundation

protocol EditAccountNavDelegate: AnyObject {
    func onEditAccountSubmitTapped(editedEmail: Bool)
    func onEditAccountBackTapped()
}

extension EditAccountView {
    
    @Observable
    class ViewModel: BaseViewModel {
        
        var name = "John Smitt"
        var email = "john@example.com"
        
        weak var navDelegate: EditAccountNavDelegate?
        
    }
    
}

// MARK: - Actions

extension EditAccountView.ViewModel {
    
    func onBackTapped() {
        navDelegate?.onEditAccountBackTapped()
    }
    
    func onSubmitTapped() {
        navDelegate?.onEditAccountSubmitTapped(editedEmail: email != "john@example.com")
    }
}

    

