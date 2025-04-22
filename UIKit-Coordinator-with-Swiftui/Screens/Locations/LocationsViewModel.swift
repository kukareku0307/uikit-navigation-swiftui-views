//
//  LocationsViewModel.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 19.04.2025.
//

import Foundation

protocol LocationsNavDelegate: AnyObject {
    func onLocationsBackTapped()
    func onLocationsShowUpgradeScreen()
    func onYourAccountTapped()
}

extension LocationsView{
    @Observable
    class ViewModel: BaseViewModel {
        weak var navDelegate: LocationsNavDelegate?
        
        var showBackButton: Bool = false
    }
}

// MARK: - Actions
extension LocationsView.ViewModel {
    func onBackTapped() {
        navDelegate?.onLocationsBackTapped()
    }
    func onUpgradeTapped() {
        navDelegate?.onLocationsShowUpgradeScreen()
    }
    func onYourAccountTapped() {
        navDelegate?.onYourAccountTapped()
    }
}


