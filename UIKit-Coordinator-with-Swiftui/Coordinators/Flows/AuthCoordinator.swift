//
//  AuthCoordinator.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 15.04.2025.
//

import UIKit

protocol AuthCoordinatorDelegate: AnyObject {
    func onAuthCoordinatonCompleted(authCoordinator: AuthCoordinator)
}

class AuthCoordinator: BaseCoordinator<UINavigationController>, ConfirmEmailCoordinating{
    
    weak var delegate: AuthCoordinatorDelegate?
    
    override func start() {
        showLoginScreen()
    }
    
}

//MARK: - Showing Screens

extension AuthCoordinator {
    func showLoginScreen() {
        let viewModel = LoginView.ViewModel(userDefaultsManager: userDefaults)
        viewModel.navDelegate = self
        
        let view = LoginView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "Login"
        
        presenter.setViewControllers([controller], animated: true)
    }
    
    func showRegisterScreen() {
        let viewModel = RegisterView.ViewModel()
        viewModel.navDelegate = self
        
        let view = RegisterView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "Register"
        
        presenter.pushViewController(controller, animated: true)
    }
    
}


//MARK: - LoginNavDelegate
extension AuthCoordinator: LoginNavDelegate {
    func onRegisterTapped() {
        showRegisterScreen()
    }
    
    func onLoginSuccessfull() {
        delegate?.onAuthCoordinatonCompleted(authCoordinator: self)
    }
    
}

// MARK: - RegisterNavDelegate
extension AuthCoordinator: RegisterNavDelegate {
    
    func onRegisterComplete() {
        showConfirmEmailScreen()
    }
    
    func onRegisterLoginTapped() {
        showLoginScreen()
    }  
}

// MARK: - ConfirmEmailNavDelegate
extension AuthCoordinator {
    
    func onConfirmEmailSubmitted() {
        showLoginScreen()
    }
    
    func onConfirmEmailBackButtonTapped() {
        presenter.popViewController(animated: true)
    }
    
}
