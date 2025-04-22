//
//  MoreView.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 16.04.2025.
//

import SwiftUI

struct MoreView: View {
    
    @State var viewModel: ViewModel
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                ListRow(title: "Account", systemImageName: "person.crop.circle") {
                   
                    viewModel.onAccountTapped()
                }
                
                ListRow(title: "Locations", systemImageName: "mappin.and.ellipse") {
                   
                    viewModel.onLocationsTapped()
                }
                
                ListRow(title: "Upgrade", systemImageName: "crown") {
                   
                    viewModel.onUpgradeTapped()
                }
            }
        }
    }
}

