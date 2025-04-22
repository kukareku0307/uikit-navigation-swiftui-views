//
//  LocationsHostingController.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 19.04.2025.
//

import UIKit

class LocationsHostingController: HostingController<LocationsView, LocationsView.ViewModel>{
    
}

extension LocationsHostingController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setup Views/Configuration
private extension LocationsHostingController {
    func setupViews() {
        title = "Locations"
        
        let image = UIImage(systemName: "crown")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: image,
            style: .plain,
            target: self,
            action: #selector(onUpgradeTapped)
        )
        
        if viewModel.showBackButton {
            setCustomBackButton(target: self, selector: #selector(onBackTapped))
        }
       
    }
}

// MARK: - Actions
extension LocationsHostingController {
    
    @objc func onBackTapped() {
        viewModel.onBackTapped()
    }
    
    @objc func onUpgradeTapped() {
        viewModel.onUpgradeTapped()
    }
    
}
