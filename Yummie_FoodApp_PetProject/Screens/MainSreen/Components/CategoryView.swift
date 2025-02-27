//
//  CategoryView.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 26.02.2025.
//

import SwiftUI

struct CategoryView: View {
    let dish: DishCategory

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            AsyncImage(
                url: URL(string: dish.image)!,
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                },
                placeholder: {
                    ProgressView()
                }
            )
            .frame(width: 60, height: 60)

            Text(dish.name)
                .font(.body)
                .frame(maxWidth: .infinity)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(width: 128, height: 128)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(12)
    }
}

#Preview {
    CategoryView(dish: DishCategory(id: "", name: "", image: ""))
}
