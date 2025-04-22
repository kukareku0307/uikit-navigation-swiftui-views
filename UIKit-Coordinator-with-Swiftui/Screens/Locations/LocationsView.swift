//
//  LocationsView.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 16.04.2025.
//

import SwiftUI

struct LocationsView: View {
    
    @State var viewModel: ViewModel
    
    private let locations = ["Moscow", "Saint-Petersburg"]
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(Array(locations.enumerated()), id: \.offset) { _, location in
                    
                    ListRow(title: location)
                }
                
                Spacer(minLength: 100)
                
                Button("Your account"){
                    viewModel.onYourAccountTapped()
                }
                .padding(.top, 10)
                
            }
        }
            .navigationBarBackButtonHidden()
    }
}

#Preview {
    LocationsView(viewModel: .init())
}
