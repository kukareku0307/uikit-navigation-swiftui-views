//
//  UserDefaultsManager.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 22.04.2025.
//

import Foundation

class UserDefaultsManager {
    
    private enum Keys {
        static let isLoggedIn = "isLoggedIn"
    }
    
    func clearAllUserDefaults() {
        guard let bundleName = Bundle.main.bundleIdentifier else {
            return
        }
        UserDefaults.standard.removePersistentDomain(forName: bundleName)
    }
    
}

    // MARK: - Accessors
extension UserDefaultsManager {
    
    var isLoggedIn: Bool {
        get {
            UserDefaults.standard.bool(forKey: Keys.isLoggedIn)
        } set {
            UserDefaults.standard.set(newValue, forKey: Keys.isLoggedIn)
        }
    }
}

