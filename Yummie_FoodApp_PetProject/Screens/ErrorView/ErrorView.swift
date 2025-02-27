//
//  ErrorView.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 26.02.2025.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let onRetry: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 40))
                .foregroundColor(.yellow)
            
            Text(message)
            
            Button {
                onRetry?()
            } label: {
                HStack {
                    Image(systemName: "gobackward")
                    Text("Retry")
                }
            }
            .buttonStyle(.borderless)
            .removed(onRetry == nil)
        }
    }
}

#Preview {
    ErrorView(message: "что-то пошло не так", onRetry: nil)
}
