//
//  UpgradeViewModel.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 19.04.2025.
//

import Foundation

protocol UpdradeViewNavDelegate: AnyObject{
    func onUpgradeClose()
}

extension UpgradeView{
    @Observable
    class ViewModel: BaseViewModel{
        weak var navDelegate: UpdradeViewNavDelegate?
    }
}

// MARK: - ACtions
extension UpgradeView.ViewModel{
    func onCloseScreen(){
        navDelegate?.onUpgradeClose()
    }
}
