//
//  SceletonViewModifier.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 27.02.2025.
//

import SwiftUI

struct SceletonViewModifier<TShape>: ViewModifier where TShape : Shape {
    var enabled: Bool
    var shape: TShape
    
    init(enabled: Bool, shape: TShape = Capsule()) {
        self.enabled = enabled
        self.shape = shape
    }
    
    func body(content: Content) -> some View {
        if enabled {
            ZStack {
                content
                    .hidden()
                SceletonView(enabled: enabled, shape: shape)
            }
            .fixedSize(horizontal: false, vertical: true)
        } else {
            content
        }
    }
}

struct SceletonView<TShape: Shape>: View {
    var enabled: Bool
    var shape: TShape
    @State private var animationOpacity = false
    
    init(enabled: Bool, shape: TShape = Capsule()) {
        self.enabled = enabled
        self.shape = shape
    }
    
    var body: some View {
        Color(.lightGray)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipShape(shape)
            .opacity(animationOpacity ? 0.3 : 1.0)
            .animation(animationOpacity ? .easeInOut(duration: 1.2).repeatForever(autoreverses: true) : nil, value: animationOpacity)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    animationOpacity = true
                }
            }
            .onDisappear {
                animationOpacity = false
            }
    }
}

struct SceletonView_Previews: PreviewProvider {
    static var previews: some View {
        SceletonView(enabled: true)
            .frame(width: 160, height: 20)
    }
}
