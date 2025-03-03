//
//  CartItemModel.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 02.03.2025.
//

import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let dish: Dish
    var quantity: Int
}
