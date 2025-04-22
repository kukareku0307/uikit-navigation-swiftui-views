//
//  MoreCoordinator.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 16.04.2025.
//

import UIKit
import SwiftUI

class MoreCoordinator: BaseCoordinator<UINavigationController>, UpgradeCoordinating {
        
    override func start() {
        showMoreScreen()
    }
}

// MARK: - Showing Screens
private extension MoreCoordinator {
    
    func showMoreScreen (){
        let viewModel = MoreView.ViewModel()
        viewModel.navDelegate = self
        let view = MoreView(viewModel: viewModel)
        let controller = HostingController(rootView: view, viewModel: viewModel)
        controller.title = "More"
        
        presenter.setViewControllers([controller], animated: true)
    }
    
    func showAccountScreen (){
       
    }
    
}

// MARK: - Starting Flows
private extension MoreCoordinator {
    
    func startAccountFlow() {
        let coordinator = AccountCoordinator(presenter: presenter, modelLayer: modelLayer)
        coordinator.delegate = self
        coordinator.start()
        
        store(coordinator: coordinator)
        
    }
    
    func startLocationsFlow() {
        let coordinator = LocationsCoordinator(presenter: presenter, modelLayer: modelLayer)
        coordinator.delegate = self
        coordinator.start()
        
        
        store(coordinator: coordinator)
    }
    
}

// MARK: - MoreViewNavDelegate
extension MoreCoordinator: MoreViewNavDelegate {
    func onMoreViewAccountTapped() {
        startAccountFlow()
    }
    
    func onMoreViewLocationsTapped() {
        startLocationsFlow()
    }
    
    func onMoreViewUpgradeTapped() {
        showUpgradeScreen()
    }
}

// MARK: - AccountCoordinatorDelegate
extension MoreCoordinator: AccountCoordinationDelegate {
    func onAccountCoordinationComplete(coordinator: AccountCoordinator) {
        free(coordinator: coordinator)
    }
}

// MARK: - Locations Coordinator Delegate
extension MoreCoordinator: LocationsCoordinatorDelegate {
    func onLocationsCoordinationComplete(coordinator: LocationsCoordinator) {
        free(coordinator: coordinator)
    }
}


