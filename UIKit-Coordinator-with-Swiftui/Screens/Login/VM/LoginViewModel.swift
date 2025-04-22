//
//  LoginViewModel.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 15.04.2025.
//

import Foundation

protocol LoginNavDelegate: AnyObject {
    func onRegisterTapped()
    func onLoginSuccessfull()
}

extension LoginView {
    
    @Observable
    class ViewModel: BaseViewModel{
        
        var email = ""
        var password = ""
        
        weak var navDelegate: LoginNavDelegate?
        
        let userDefaultsManager: UserDefaultsManager
        
        init(userDefaultsManager: UserDefaultsManager){
            self.userDefaultsManager = userDefaultsManager
        }
        
    }
}

//MARK: - Actions

extension LoginView.ViewModel{
    
    func onLoginTapped(){
        userDefaultsManager.isLoggedIn = true
        navDelegate?.onLoginSuccessfull()
    }
        func onRegisterTapped(){
            
            navDelegate?.onRegisterTapped()
        }
    }
