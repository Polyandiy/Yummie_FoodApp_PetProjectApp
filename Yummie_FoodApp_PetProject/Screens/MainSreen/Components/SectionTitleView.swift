//
//  SectionTitleView.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 26.02.2025.
//

import SwiftUI

struct SectionTitleView: View {
    let title: String
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
                Text("See All")
                    .foregroundColor(.pink)
            }
            .buttonStyle(.borderless)
            .removed(action == nil)
        }
    }
}

#Preview {
    SectionTitleView(title: "Категория", action: nil)
}
