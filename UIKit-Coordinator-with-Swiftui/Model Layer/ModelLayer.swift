//
//  ModelLayer.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 22.04.2025.
//

import Foundation

/// System Layer / Data Layer / Network Layer
class ModelLayer{
    
    let systemLayer: SystemLayer
    
    init(systemLayer: SystemLayer) {
        self.systemLayer = systemLayer
    }
    
}

extension ModelLayer {
    
    func logout() {
        systemLayer.logout()
    }
    
}
