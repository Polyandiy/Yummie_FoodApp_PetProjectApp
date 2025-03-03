//
//  MainTabView.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 02.03.2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MainScreen()
                .tabItem {
                    Label("Главная", systemImage: "house")
                }
            
            CartScreen()
                .tabItem {
                    Label("Корзина", systemImage: "cart")
                }
            
            PersonalCabinetScreen()
                .tabItem {
                    Label("Профиль", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainTabView()
}
