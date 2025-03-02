//
//  OnboardScreen.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 28.02.2025.
//

import SwiftUI

struct OnboardScreen: View {
    @State private var selection: Int = 0
    @Binding var showOnboarding: Bool
    
    var body: some View {
        TabView(selection: $selection) {
            OnboardView(imageName: "Onboard1",
                        title: "Свежая еда",
                        description: "Заказывайте еду из лучших ресторанов",
                        nextAction: goNext)
            .tag(0)
            
            OnboardView(imageName: "Onboard2",
                        title: "Наш Шеф-повар",
                        description: "Наши повара — опытные профессионалы, которые гордятся тем, что готовят вкусные блюда.", nextAction: goNext)
            .tag(1)
            
            OnboardView(imageName: "Onboard3",
                        title: "Доставка",
                        description: "Наша команда доставки работает не покладая рук, чтобы гарантировать, что ваша еда будет доставлена ​​горячей, свежей и вовремя.",
                        showDoneButton: true,
                        nextAction: {
                showOnboarding = false
            })
            .tag(2)
            
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

extension OnboardScreen {
    func goNext() {
        withAnimation {
            selection += 1
        }
    }
}

#Preview {
    OnboardScreen(showOnboarding: .constant(true))
}
