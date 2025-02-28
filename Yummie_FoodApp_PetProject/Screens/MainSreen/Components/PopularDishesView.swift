//
//  PopularDishesView.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 26.02.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct PopularDishesView: View {
    let dish: Dish

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            HStack(alignment: .top) {
                //Image(systemName: "heart") //сделать кнопку в правом углу

                let url = URL(string: dish.image)
                WebImage(url: url, sceleton: {
                    SceletonView(enabled: true, shape: RoundedRectangle(cornerRadius: 4))
                }, placeholder: {
                    NoImageView()
                })
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .cornerRadius(8)
            }

            Spacer()

            Text("Breakfast")
                .font(.caption)
                .foregroundColor(.teal)

            Text(dish.name)
                .fontWeight(.medium)

            HStack(spacing: 2) {
                ForEach(0..<5) { _ in
                    Image(systemName: "star.fill")
                        .renderingMode(.template)
                        .foregroundColor(.pink)
                }
            }

            Text("\(dish.calories) ккал")
                .font(.caption)
                .foregroundColor(.pink)

            HStack {
                Image(systemName: "clock")
                Text("10 мин")

                Image(systemName: "bell")
                Text("4 порции")
            }
            .font(.caption2)
            .foregroundColor(.gray)
        }
        .padding()
        .frame(width: 180)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(20.0)
    }
}

#Preview {
    PopularDishesView(dish: Dish(id: "", name: "", description: "", image: "", calories: 0))
}
