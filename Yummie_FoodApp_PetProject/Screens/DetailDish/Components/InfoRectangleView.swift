//
//  InfoRectangleView.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 28.02.2025.
//

import SwiftUI

struct InfoRectangleView: View {
    let imageName: String?
    let text: String

    var body: some View {
        HStack(spacing: 8) {
            Image(imageName ?? "")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.pink)
                .removed(imageName == nil)

            Text(text)
        }
        .padding(.horizontal, 10)
        .frame(height: 44)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray, lineWidth: 1)
        )
    }
}

#Preview {
    InfoRectangleView(imageName: nil, text: "info")
}
