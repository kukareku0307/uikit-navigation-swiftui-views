//
//  HomeCoordinator.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 16.04.2025.
//

import UIKit
import SwiftUI

class HomeCoordinator: BaseCoordinator<UINavigationController> {
    
    override func start() {
        showHomeScreen()
    }
}

// MARK: - Showing Screen

private extension HomeCoordinator {
    
    func showHomeScreen() {
        let view = HomeView()
        let controller = UIHostingController(rootView: view)
        controller.title = "Home"
        
        presenter.setViewControllers([controller], animated: true)
        
    }
}
