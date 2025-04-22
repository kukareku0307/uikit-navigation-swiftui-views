//
//  MainCoordinator.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 16.04.2025.
//

import UIKit

protocol MainCoordinatorDelegate: AnyObject {
    func onMainCoordinatorComplete(coordinator: MainCoordinator)
}

enum NavigationBarTag: Int {
    
    case home
    case locations
    case more
    
}

class MainCoordinator: BaseCoordinator<UINavigationController> {
    
    weak var delegate: MainCoordinatorDelegate?
    
    override func start() {
        presenter.setNavigationBarHidden(true, animated: true)
        showTabBarView()
    }
}


// MARK: - Showing Screens

private extension MainCoordinator {
    
    func showTabBarView(){
        let HomeCoordinator = configureHomeCoordinator()
        let LocationsCoordinator = configureLocationsCoordinator()
        let MoreCoordinator = configureMoreCoordinator()
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([HomeCoordinator.presenter, LocationsCoordinator.presenter, MoreCoordinator.presenter], animated: false)
        
        presenter.setViewControllers([tabBarController], animated: true)
        
    }
    
}


// MARK: - Sub Coordinator

private extension MainCoordinator {
    
    func configureHomeCoordinator() -> HomeCoordinator {
        let flowPresenter = UINavigationController()
        flowPresenter.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: NavigationBarTag.home.rawValue)
        
        let coordinator = HomeCoordinator(presenter: flowPresenter, modelLayer: modelLayer)
        coordinator.start()
        
        store(coordinator: coordinator)
        return coordinator
    }
    
    func configureLocationsCoordinator() -> LocationsCoordinator {
        let flowPresenter = UINavigationController()
        flowPresenter.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "mappin.and.ellipse"), tag: NavigationBarTag.home.rawValue)
        
        let coordinator = LocationsCoordinator(presenter: flowPresenter, modelLayer: modelLayer)
        coordinator.start()
        
        store(coordinator: coordinator)
        return coordinator
    }
    
    func configureMoreCoordinator() -> MoreCoordinator {
        let flowPresenter = UINavigationController()
        flowPresenter.tabBarItem = UITabBarItem(title: "More", image: UIImage(systemName: "line.3.horizontal"), tag: NavigationBarTag.home.rawValue)
        
        let coordinator = MoreCoordinator(presenter: flowPresenter, modelLayer: modelLayer)
        coordinator.start()
        
        store(coordinator: coordinator)
        return coordinator
    }
    
}

