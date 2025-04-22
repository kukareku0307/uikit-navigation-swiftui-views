//
//  SystemLayer.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 22.04.2025.
//

import Foundation

class SystemLayer {
    
    let userDefaults: UserDefaultsManager
    
    init(userDefaults: UserDefaultsManager) {
        self.userDefaults = userDefaults
    }
    
}

// MARK: Logout
extension SystemLayer {
    
    func logout() {
        userDefaults.clearAllUserDefaults()
    }
}
