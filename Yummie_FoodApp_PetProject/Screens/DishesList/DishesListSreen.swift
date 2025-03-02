//
//  DishesListSreen.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 26.02.2025.
//

import SwiftUI

struct DishesListSreen: View {
    let title: String
    let dishes: [Dish]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 16) {
                let totalWidth = UIScreen.main.bounds.width
                let spacing: CGFloat = 16
                let totalSpacing = (spacing * 2) + 12
                let dynamicWidth = (totalWidth - totalSpacing) / 2
                
                LazyVGrid(columns: [
                    GridItem(.fixed(dynamicWidth), spacing: 12),
                    GridItem(.fixed(dynamicWidth), spacing: 12)
                ], spacing: 16) {
                    ForEach(dishes, id: \.id) { dish in
                        NavigationLink {
                            DetailDishScreen(dish: dish)
                        } label: {
                            PopularDishesView(dish: dish)
                                .frame(height: 250)
                        }
                        .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 24)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DishesListSreen(title: "", dishes: [Dish(id: "1", name: "Тортилья", description: "Описание описание", image: "https://p3y6v9e6.stackpathcdn.com/wp-content/uploads/zikoko/2020/03/D1sPmD5XQAA7Hjh.jpg", calories: 120),Dish(id: "2", name: "Тортилья", description: "Описание описание", image: "https://p3y6v9e6.stackpathcdn.com/wp-content/uploads/zikoko/2020/03/D1sPmD5XQAA7Hjh.jpg", calories: 120), Dish(id: "3", name: "Тортилья", description: "Описание описание", image: "https://p3y6v9e6.stackpathcdn.com/wp-content/uploads/zikoko/2020/03/D1sPmD5XQAA7Hjh.jpg", calories: 120), Dish(id: "4", name: "Тортилья", description: "Описание описание", image: "https://p3y6v9e6.stackpathcdn.com/wp-content/uploads/zikoko/2020/03/D1sPmD5XQAA7Hjh.jpg", calories: 120), Dish(id: "5", name: "Тортилья", description: "Описание описание", image: "https://p3y6v9e6.stackpathcdn.com/wp-content/uploads/zikoko/2020/03/D1sPmD5XQAA7Hjh.jpg", calories: 120)])
        .embedInNavigationView()
}
