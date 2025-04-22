//
//  LocationsCoordinator.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 16.04.2025.
//

import UIKit
import SwiftUI

protocol LocationsCoordinatorDelegate: AnyObject{
    func onLocationsCoordinationComplete(coordinator: LocationsCoordinator)
}

class LocationsCoordinator: BaseCoordinator<UINavigationController>, UpgradeCoordinating {
    
    weak var delegate: LocationsCoordinatorDelegate?
    
    override func start() {
        showLocationsScreen()
    }
}

// MARK: - Showing Screens

private extension LocationsCoordinator {
    
    func showLocationsScreen (){
        let viewModel = LocationsView.ViewModel()
        viewModel.navDelegate = self
        viewModel.showBackButton = embeddedInExistingNavStack
        
        let view = LocationsView(viewModel: viewModel)
        let controller = LocationsHostingController(rootView: view, viewModel: viewModel)
        controller.title = "Locations"
        
        pushInitialControllerBasedOnEmbeddedNavState(controller: controller)
    }
}

// MARK: - Starting Flows
private extension LocationsCoordinator {
    
    func startAccountFlow() {
        let accountPresenter: UINavigationController = .init()
        
        let coordinator = AccountCoordinator(presenter: accountPresenter, modelLayer: modelLayer)
        coordinator.delegate = self
        coordinator.start()
        
        presenter.present(accountPresenter, animated: true)
        
        store(coordinator: coordinator)
        
    }
    
}

// MARK: - LocationsNavDelegate
extension LocationsCoordinator: LocationsNavDelegate {
    
    func onLocationsBackTapped() {
        presenter.popViewController(animated: true)
        delegate?.onLocationsCoordinationComplete(coordinator: self)
    }
    
    func onLocationsShowUpgradeScreen() {
        showUpgradeScreen()
    }
    
    func onYourAccountTapped() {
        startAccountFlow()
    }
    
}

// MARK: - AccountcoordinatingDelegate
extension LocationsCoordinator: AccountCoordinationDelegate {
    func onAccountCoordinationComplete(coordinator: AccountCoordinator) {
        self.free(coordinator: coordinator)
        
    }
}
