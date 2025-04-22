//
//  ConfirmEmailViewModel.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 18.04.2025.
//

import Foundation

protocol ConfirmEmailNavDelegate: AnyObject {
    func onConfirmEmailSubmitted()
    func onConfirmEmailBackButtonTapped()
}

extension ConfirmEmailView{
    
    
    @Observable
    class ViewModel: BaseViewModel {
        
        weak var navDelegate: ConfirmEmailNavDelegate?
        
        var emailCode = "12345"
        var showSubmittedAler = false
        
    }
}

// MARK: - Actions
extension ConfirmEmailView.ViewModel {
    func onConfirmEmailSubmitted() {
        navDelegate?.onConfirmEmailSubmitted()
    }
    
    
    
    func onConfirmEmailBackButtonTapped() {
        navDelegate?.onConfirmEmailBackButtonTapped()
    }
}
