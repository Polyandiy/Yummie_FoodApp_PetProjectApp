//
//  SectionTitleView.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 26.02.2025.
//

import SwiftUI

struct SectionTitleView: View {
    let title: String
    let count: Int
    let action: (() -> Void)?
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            
            Spacer()
            
            Button {
                action?()
            } label: {
                Text("Все \(count)")
                    .foregroundColor(.pink)
            }
            .buttonStyle(.borderless)
        }
    }
}

#Preview {
    SectionTitleView(title: "Категория", count: 0, action: nil)
}
