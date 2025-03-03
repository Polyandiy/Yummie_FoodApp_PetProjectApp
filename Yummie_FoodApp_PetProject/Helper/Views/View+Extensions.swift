//
//  View+Extensions.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 28.02.2025.
//

import SwiftUI

public extension View {
    func embedInNavigationView() -> some View {
        NavigationView {
            self
        }
    }
    
    func embedInNavigationStack() -> some View {
        NavigationStack {
            self
        }
    }
}

extension View {
    @ViewBuilder
    func bottom<Content: View>(show: Bool = true, _ content: Content) -> some View {
        VStack(spacing: 0) {
            self
            content
                .removed(!show)
        }
    }
}

extension View {
    func bottom<Content: View>(show: Bool = true, @ViewBuilder content: @escaping () -> Content) -> some View {
        bottom(show: show, content())
    }
}
