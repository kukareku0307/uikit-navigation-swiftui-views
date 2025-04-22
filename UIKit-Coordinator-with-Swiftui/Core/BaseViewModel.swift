//
//  BaseViewModel.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 15.04.2025.
//

import UIKit

class BaseViewModel {
    //MARK: 'weak' not to create strong reference, prevent retain cycle
    weak var hostingController: UIViewController?
}
