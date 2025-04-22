//
//  EditAccountHostingController.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 18.04.2025.
//

import Foundation

class EditAccountHostingController: HostingController<EditAccountView, EditAccountView.ViewModel> {}

// MARK: - LifeCycle

extension EditAccountHostingController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setup Views/Configuration

extension EditAccountHostingController {
    func setupViews() {
        title = "Edit Account"
        
        setCustomBackButton(target: self, selector: #selector(onBackTapped))
    }
}

// MARK: - Actions

extension EditAccountHostingController {
    @objc func onBackTapped() {
        viewModel.onBackTapped()
    }
}
