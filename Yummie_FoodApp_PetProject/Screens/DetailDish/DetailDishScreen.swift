//
//  DetailDishScreen.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 26.02.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailDishScreen: View {
    let dish: Dish
    
    var body: some View {
        VStack(spacing: 30) {
            let url = URL(string: dish.image)
            WebImage(url: url, sceleton: {
                SceletonView(enabled: true, shape: RoundedRectangle(cornerRadius: 4))
            }, placeholder: {
                NoImageView()
                    .padding(.all, 50)
            })
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .cornerRadius(20)
            
            Divider()
                .padding(.horizontal, -16)
            
            VStack(alignment: .leading, spacing: 16) {
                HStack(spacing: 4) {
                    InfoRectangleView(imageName: "star", text: "4.9")
                    
                    InfoRectangleView(imageName: "delivery_icon", text: "20 мин")
                    
                    InfoRectangleView(imageName: nil, text: "120 ккал")
                }
                
                Text("Descrption")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(dish.description)
                        .lineLimit(4)
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    Button {
                        //MARK: 
                        print("Read more")
                    } label: {
                        Text("Read more")
                            .foregroundColor(.pink)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Price")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("$137.50")
                        .font(.headline)
                }
                
                Spacer()
                
                Button {
                    print("Add to Cart")
                } label: {
                    Text("Add to Cart")
                        .foregroundColor(.pink)
                        .fontWeight(.medium)
                        .padding(8)
                }
                .buttonStyle(.bordered)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(UIColor.systemGray5))
            .cornerRadius(20)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 16)
        .background(Color(.systemGroupedBackground))
        .navigationTitle(dish.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    print("добавить в избранное")
                } label: {
                    Image(systemName: "heart")
                        .foregroundColor(.pink)
                }
            }
        }
    }
}

#Preview {
    DetailDishScreen(dish: .init(id: "", name: "Тортилья", description: "Описание описание описание описание описание описание описание описание описание", image: "https://p3y6v9e6.stackpathcdn.com/wp-content/uploads/zikoko/2020/03/D1sPmD5XQAA7Hjh.jpg", calories: 120))
        .embedInNavigationView()
}
