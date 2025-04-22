//
//  ConfirmEmailCoordinator.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 18.04.2025.
//

import UIKit

protocol ConfirmEmailCoordinating: BaseCoordinator<UINavigationController>, ConfirmEmailNavDelegate {}

// MARK: - Showing Screens
extension ConfirmEmailCoordinating{
    func showConfirmEmailScreen() {
        let viewModel = ConfirmEmailView.ViewModel()
        viewModel.navDelegate = self
        
        let view = ConfirmEmailView(viewModel: viewModel)
        let controller = ConfrimEmailHostingController(rootView: view, viewModel: viewModel)
        presenter.pushViewController(controller, animated: true)
       
    }
}
