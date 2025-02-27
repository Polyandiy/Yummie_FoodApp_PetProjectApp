//
//  LoadingViewModifier.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 27.02.2025.
//

import SwiftUI

private struct LoadingViewModifier: ViewModifier {
    public var showProgressView = false
    public var hideContent = false
    
    public var progressViewControlSize: ControlSize
    public var progressViewTint: Color? = nil
    
    public func body(content: Content) -> some View {
        content
            .hidden(showProgressView && hideContent)
            .overlay {
                ProgressView()
                    .controlSize(progressViewControlSize)
                    .tint(progressViewTint)
                    .removed(!showProgressView)
            }
    }
}

public extension View {
    func showProgressView(_ show: Bool, hideContent: Bool = false, controlSize: ControlSize = .regular, tint: Color? = nil) -> some View {
        return self.modifier(LoadingViewModifier(showProgressView: show, hideContent: hideContent, progressViewControlSize: controlSize, progressViewTint: tint))
    }
}
