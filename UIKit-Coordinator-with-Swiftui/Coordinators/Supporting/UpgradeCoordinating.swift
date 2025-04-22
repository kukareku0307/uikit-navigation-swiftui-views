//
//  UpgradeCoordinating.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 19.04.2025.
//

import UIKit

protocol UpgradeCoordinating: BaseCoordinator<UINavigationController>, UpdradeViewNavDelegate {}

// MARK: - Showing Screens
extension UpgradeCoordinating{
    func showUpgradeScreen(){
        let viewModel = UpgradeView.ViewModel()
        viewModel.navDelegate = self
        
        let view = UpgradeView(viewModel: viewModel)
        let controller = UpgradeHostingController(rootView: view, viewModel: viewModel)
        
        let wrapper = UINavigationController(rootViewController: controller)
        
        presenter.present(wrapper, animated: true)
    }
}

// MARK: - UpgradeViewNavDelegate
extension UpgradeCoordinating{
    
    func onUpgradeClose() {
        presenter.dismiss(animated: true)
    }
    
}
