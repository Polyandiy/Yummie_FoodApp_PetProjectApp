//
//  Yummie_FoodApp_PetProjectApp.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 26.02.2025.
//

import SwiftUI

@main
struct Yummie_FoodApp_PetProjectApp: App {
    @AppStorage("showOnboarding") var showOnboarding: Bool = true
    @StateObject private var cartManager = CartManager()
    
    var body: some Scene {
        WindowGroup {
            if showOnboarding {
                OnboardScreen(showOnboarding: $showOnboarding)
            }else {
                MainTabView()
                    .environmentObject(cartManager)
            }
        }
    }
}
