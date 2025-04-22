//
//  ApplicationCoordinator.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 13.04.2025.
//

import Combine
import UIKit
import SwiftUI

class ApplicationCoordinator: BaseCoordinator<UINavigationController> {
    
    let window: UIWindow
    
    let logoutNotification = NotificationCenter.default.publisher(for: .logout)
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(window: UIWindow) {
        self.window = window
        
        let presenter = UINavigationController()
        presenter.isToolbarHidden = true
        
        let systemLayer = SystemLayer(userDefaults: .init())
        let modelLayer = ModelLayer(systemLayer: systemLayer)

        super.init(presenter: presenter, modelLayer: modelLayer)
        
        self.window.rootViewController = presenter
        self.window.makeKeyAndVisible()
        
        configure()
    }
    
    override func start() {
        if userDefaults.isLoggedIn {
            startMain()
        } else {
            startAuth()
        }
            
    }
    
    private func logout() {
        modelLayer.logout()
        start()
    }
}

// MARK: - Configuration
private extension ApplicationCoordinator {
    
    func configure() {
        logoutNotification
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] _ in
                guard let self else { return }
                logout()
            }
            .store(in: &cancellables)
    }
    
}

// MARK: - Showing Screens

extension ApplicationCoordinator {
    
    func startAuth() {
        let authCoordinator = AuthCoordinator(presenter: presenter, modelLayer: modelLayer)
        authCoordinator.delegate = self
        authCoordinator.start()
        
        ///TODO затестить что будет если не сохранить
        
        self.store(coordinator: authCoordinator)
        
    }
    
    func startMain() {
        let mainCoordinator = MainCoordinator(presenter: presenter, modelLayer: modelLayer)
        mainCoordinator.delegate = self
        mainCoordinator.start()
        
        self.store(coordinator: mainCoordinator)
    }
    
}

extension ApplicationCoordinator: AuthCoordinatorDelegate {
    func onAuthCoordinatonCompleted(authCoordinator: AuthCoordinator) {
        start()
        self.free(coordinator: authCoordinator)
    }
}

extension ApplicationCoordinator: MainCoordinatorDelegate {
    func onMainCoordinatorComplete(coordinator: MainCoordinator) {
        start()
        self.free(coordinator: coordinator)
    }
    
}

