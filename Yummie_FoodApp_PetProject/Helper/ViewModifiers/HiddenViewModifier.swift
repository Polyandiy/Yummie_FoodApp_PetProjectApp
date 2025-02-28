//
//  HiddenViewModifier.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 27.02.2025.
//

import SwiftUI

public struct HiddenViewModifier: ViewModifier {
    let hidden: Bool
    
    public init(_ hidden: Bool) {
        self.hidden = hidden
    }
    
    public func body(content: Content) -> some View {
        if hidden {
            content
                .hidden()
        } else {
            content
        }
    }
}

public extension View {
    func hidden(_ hidden: Bool) -> some View {
        return self.modifier(HiddenViewModifier(hidden))
    }
}
