//
//  NavigationLink+EmptyView.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 27.02.2025.
//

import SwiftUI

extension NavigationLink where Label == EmptyView {
    static func EmptyLabel(@ViewBuilder destination: @escaping () -> Destination) -> NavigationLink {
        self.init(destination: destination, label: { EmptyView() })
    }
}
