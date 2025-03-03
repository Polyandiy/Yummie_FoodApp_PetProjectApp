//
//  View+OnAppear.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 02.03.2025.
//

import SwiftUI

struct OnFirstAppearViewModifier: ViewModifier {
    @State private var onAppearIsCalled = false
    let action: (() -> Void)?
    
    func body(content: Content) -> some View {
        if action != nil {
            content
                .onAppear {
                    guard !onAppearIsCalled else { return }
                    onAppearIsCalled = true
                    action!()
                }
        } else {
            content
        }
    }
}

public extension View {
    func onFirstAppear(perform action: (() -> Void)? = nil) -> some View {
        return self.modifier(OnFirstAppearViewModifier(action: action))
    }
}
