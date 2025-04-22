//
//  AccountHostingController.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 16.04.2025.
//

import UIKit

class AccountHostingController: HostingController<AccountView, AccountView.ViewModel> {}

// MARK: - Lifecycle
extension AccountHostingController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
}


// MARK: - View Setup/Configuration
private extension AccountHostingController {
    
    func setupViews() {
        title  = "Account"
        
        if viewModel.showExitButton {
            setNavigationExitButton(target: self, selector: #selector(onExitButtonTapped))
        }
        else{
            setCustomBackButton(target: self, selector: #selector(onBackButtonTapped))
        }
    }
    
}

extension AccountHostingController{
    
    @objc func onBackButtonTapped() {
        viewModel.onBackTapped()
    }
    
    @objc func onExitButtonTapped() {
        viewModel.onExitTapped()
    }
    
}
