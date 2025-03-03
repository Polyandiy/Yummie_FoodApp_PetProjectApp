//
//  CartManager.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 02.03.2025.
//

import SwiftUI

final class CartManager: ObservableObject {
    @Published private(set) var items: [CartItem] = []
    
    func addToCart(_ dish: Dish) {
        if let index = items.firstIndex(where: { $0.dish.id == dish.id }) {
            items[index].quantity += 1
        } else {
            let newItem = CartItem(dish: dish, quantity: 1)
            items.append(newItem)
        }
    }
    
    func removeFromCart(_ dish: Dish) {
        if let index = items.firstIndex(where: { $0.dish.id == dish.id }) {
            if items[index].quantity > 1 {
                items[index].quantity -= 1
            } else {
                items.remove(at: index)
            }
        }
    }
    
    func itemCount(for dish: Dish) -> Int {
        return items.first(where: { $0.dish.id == dish.id })?.quantity ?? 0
    }
    
    func isInCart(_ dish: Dish) -> Bool {
        return itemCount(for: dish) > 0
    }
    
    func clearCart() {
        items.removeAll()
    }
    
    func removeAll(of dish: Dish) {
        items.removeAll { $0.dish.id == dish.id }
    }
}
