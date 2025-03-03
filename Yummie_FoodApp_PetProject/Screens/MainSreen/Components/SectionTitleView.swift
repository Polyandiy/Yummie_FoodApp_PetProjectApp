//
//  SectionTitleView.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 26.02.2025.
//

import SwiftUI

struct SectionTitleView: View {
    @EnvironmentObject var cartManager: CartManager
    
    let title: String
    let dishes: [Dish]
    let action: (() -> Void)?
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            
            Spacer()
            
            NavigationLink {
                DishesListSreen(title: title, dishes: dishes)
                    .environmentObject(cartManager)
            } label: {
                Text("Все \(dishes.count)")
                    .foregroundColor(.pink)
            }
        }
    }
}

#Preview {
    SectionTitleView(title: "Категория", dishes: [], action: nil)
}
