//
//  ConfirmEmailHostingController.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 18.04.2025.
//

import Foundation

class ConfrimEmailHostingController: HostingController<ConfirmEmailView, ConfirmEmailView.ViewModel> {}

// MARK: - LifeCycle

extension ConfrimEmailHostingController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setup Views/Configuration

extension ConfrimEmailHostingController {
    func setupViews() {
        title = "Confirm Email"
        
        setCustomBackButton(target: self, selector: #selector(onBackTapped))
    }
}

// MARK: - Actions

extension ConfrimEmailHostingController {
    @objc func onBackTapped() {
        viewModel.onConfirmEmailBackButtonTapped()
    }
}
