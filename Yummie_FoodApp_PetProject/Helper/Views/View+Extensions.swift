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
}
