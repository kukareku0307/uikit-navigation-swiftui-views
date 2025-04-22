//
//  ListRow.swift
//  UIKit-Coordinator-with-Swiftui
//
//  Created by Максим Яшин on 16.04.2025.
//

import SwiftUI

struct ListRow: View {
    
    var title: String
    var trailing: String?
    var systemImageName: String?
    
    var showTrailingChevron = false
    var action: (()->Void)? = nil
    
    var body: some View {
        VStack {
            HStack {
                if let systemImageName{
                    Image(systemName: systemImageName)
                        .frame(width: 20)
                }
                
                Text(title)
                
                Spacer()
                
                if let trailing{
                    Text(verbatim: trailing)
                }
                
                if showTrailingChevron {
                    Image(systemName: "chevron.right")
                }
            }.padding(.trailing, 20)
            
            Rectangle()
                .foregroundStyle(.gray.opacity(0.5))
                .frame(height: 1)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            
            action?()
        }
        .padding(.leading, 20)
        .padding(.top, 5)
    }
}

