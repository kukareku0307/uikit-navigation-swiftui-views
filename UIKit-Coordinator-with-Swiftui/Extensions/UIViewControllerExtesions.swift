//
//  UIViewControllerExtesions.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 17.04.2025.
//

import UIKit

extension UIViewController {
    
    
    
    func setCustomBackButton(target: Any?, selector: Selector){
        navigationItem.hidesBackButton = true
        navigationItem.setHidesBackButton(true, animated: false)
        
        let backImage = UIImage(systemName: "chevron.left")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let backButton = UIBarButtonItem(image: backImage, style: .plain, target: target, action: selector)
        navigationItem.leftBarButtonItem = backButton
        
    }
    
    func setNavigationExitButton(target: Any?, selector: Selector){
        let chosenIcon = UIImage(systemName: "xmark")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let closeButton = UIBarButtonItem(image: chosenIcon, style: .plain, target: target, action: selector)
        navigationItem.rightBarButtonItem = closeButton
    }
    
}
