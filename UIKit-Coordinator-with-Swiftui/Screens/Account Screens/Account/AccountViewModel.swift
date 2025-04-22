//
//  AccountViewModel.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 16.04.2025.
//

import SwiftUI
import UIKit

protocol AccountNavDelegate: AnyObject {
    func onAccountBackTapped()
    func onAccountExitTapped()
    func onAccountEditTapped()
    func onAccountLogoutTapped()
}

extension AccountView {
    
    @Observable
    class ViewModel: BaseViewModel {
        weak var navDelegate: AccountNavDelegate?
        var showExitButton: Bool = false
        
        
    }
}

// MARK: - Actions

extension AccountView.ViewModel {
    
    func onBackTapped() {
        navDelegate?.onAccountBackTapped()
    }
    
    func onExitTapped() {
        navDelegate?.onAccountExitTapped()
    }
    
    func onEditTapped() {
        navDelegate?.onAccountEditTapped()
    }
    
    func onLogoutTapped() {
        navDelegate?.onAccountLogoutTapped()
    }
    
    
    
}

