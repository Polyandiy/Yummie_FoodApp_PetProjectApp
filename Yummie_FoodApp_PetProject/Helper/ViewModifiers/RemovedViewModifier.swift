//
//  RemovedViewModifier.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 27.02.2025.
//

import SwiftUI

public struct RemovedViewModifier: ViewModifier {
    let removed: Bool
    
    public init(_ removed: Bool) {
        self.removed = removed
    }
    
    public func body(content: Content) -> some View {
        if !removed {
            content
        }
    }
}

public extension View {
    func removed(_ removed: Bool) -> some View {
        return self.modifier(RemovedViewModifier(removed))
    }
}
