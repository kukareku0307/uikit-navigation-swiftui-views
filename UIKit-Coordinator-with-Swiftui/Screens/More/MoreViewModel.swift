//
//  MoreViewModel.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 17.04.2025.
//

import Foundation

protocol MoreViewNavDelegate : AnyObject {
    func onMoreViewAccountTapped()
    func onMoreViewLocationsTapped()
    func onMoreViewUpgradeTapped()
}

extension MoreView {
    @Observable
    class ViewModel: BaseViewModel {
        weak var navDelegate: MoreViewNavDelegate?
    }
}

//MARK: - Actions
extension MoreView.ViewModel {
    func onAccountTapped() {
        debugPrint("Tapped")
        navDelegate?.onMoreViewAccountTapped()
    }
    
    func onLocationsTapped() {
        navDelegate?.onMoreViewLocationsTapped()
    }
    
    func onUpgradeTapped() {
        navDelegate?.onMoreViewUpgradeTapped()
    }
}
