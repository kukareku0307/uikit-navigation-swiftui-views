//
//  UpgradeHostingController.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 19.04.2025.
//

import Foundation

class UpgradeHostingController: HostingController<UpgradeView, UpgradeView.ViewModel> {}

// MARK: - LifeCycle
extension UpgradeHostingController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setup Views/Configuration
extension UpgradeHostingController {
    func setupViews() {
        title = "Upgrade"
        
        setNavigationExitButton(target: self, selector: #selector(onBackTapped))
    }
}

// MARK: - Actions
extension UpgradeHostingController {
    @objc func onBackTapped() {
        viewModel.onCloseScreen()
    }
}
