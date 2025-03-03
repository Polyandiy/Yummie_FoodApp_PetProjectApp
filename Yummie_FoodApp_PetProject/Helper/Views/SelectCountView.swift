//
//  SelectCountView.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 03.03.2025.
//

import SwiftUI

struct SelectCountView: View {
    var count: Int
    var onIncrement: (() -> Void)
    var onDecrement: (() -> Void)
    
    var body: some View {
        if count == 0 {
            Button(action: onIncrement) {
                Text("В корзину")
                    .foregroundColor(.pink)
                    .fontWeight(.medium)
                    .padding(.horizontal, 8)
            }
            .buttonStyle(.bordered)
        } else {
            HStack(alignment: .center, spacing: 0) {
                selectedCountButton(imageName: "minus") {
                    onDecrement()
                }
                
                Text("\(count)")
                    .lineLimit(1)
                    .frame(width: 32, alignment: .center)
                
                selectedCountButton(imageName: "plus") {
                    onIncrement()
                }
            }
        }
    }
}

extension SelectCountView {
    @ViewBuilder
    func selectedCountButton(imageName: String, action: @escaping () -> ()) -> some View {
        Button {
            action()
        } label: {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(.secondarySystemBackground))
                .frame(width: 24, height: 24)
                .overlay(
                    ZStack(alignment: .center, content: {
                        Image(systemName: imageName)
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color.black)
                        
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(.separator), lineWidth: 1)
                    })
                )
        }
        .buttonStyle(.borderless)
    }
}

#Preview {
    SelectCountView(count: 0, onIncrement: {}, onDecrement: {})
}
