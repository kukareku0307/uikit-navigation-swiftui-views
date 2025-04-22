//
//  RegisterViewModel.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 15.04.2025.
//

import Foundation

protocol RegisterNavDelegate: AnyObject {
    func onRegisterComplete()
    func onRegisterLoginTapped()
}

extension RegisterView{
    
    @Observable
    class ViewModel: BaseViewModel{
        
        var email: String = ""
        var password: String = ""
        var confirmPassword: String = ""
        
        var showAlert = false
        var alertTitle: String = ""
        var alertMessage: String = ""
        var registrationSuccessful: Bool = false
        
        weak var navDelegate: RegisterNavDelegate?
    }
    
}

// MARK: - Actions

extension RegisterView.ViewModel{
    
    func onRegisterTapped(){
        registrationSuccessful = true
        alertTitle = "Registartion successfullyy!!"
        showAlert = true
    }
    
    func onRegisterComplete(){
        navDelegate?.onRegisterComplete()
    }
    
    func onLoginTapped(){
        navDelegate?.onRegisterLoginTapped()
    }
}
