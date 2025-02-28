//
//  RecommendedView.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 26.02.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecommendedView: View {
    let dish: Dish

    var body: some View {
        HStack {
            let url = URL(string: dish.image)
            WebImage(url: url, sceleton: {
                SceletonView(enabled: true, shape: RoundedRectangle(cornerRadius: 4))
            }, placeholder: {
                NoImageView()
            })
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 60, height: 60)
            .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 4) {
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
                    Text("\(dish.calories) ккал")
                        .font(.caption)
                        .foregroundColor(.pink)
                        .padding(.leading)
                }
                .padding(.bottom, 4)
                
                HStack {
                    Image(systemName: "clock")
                    Text("10 mins")
                    
                    Image(systemName: "bell")
                    Text("4 порции")
                }
                .font(.caption2)
                .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack {
                Image(systemName: "heart")
                Spacer()
            }
            .frame(maxHeight: .infinity)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(20)
    }}

#Preview {
    RecommendedView(dish: Dish(id: "", name: "", description: "", image: "", calories: 0))
}
