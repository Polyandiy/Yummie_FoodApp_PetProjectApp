//
//  CartScreen.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 02.03.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartScreen: View {
    @EnvironmentObject var cartManager: CartManager
    @State var showAlert: Bool = false
    
    var body: some View {
        List {
            ForEach(cartManager.items, id: \.id) { cartItem in
                cartItemView(cartItem)
                    .swipeActions {
                        Button(role: .destructive) {
                            cartManager.removeAll(of: cartItem.dish)
                        } label: {
                            Label("Удалить", systemImage: "trash.fill")
                        }
                    }
            }
        }
        .listStyle(.grouped)
        .overlay(content: {
            emptyCartView()
                .removed(!cartManager.items.isEmpty)
        })
        .navigationTitle("Корзина")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showAlert.toggle()
                } label: {
                    Image(systemName: "trash")
                        .foregroundColor(.pink)
                }
                .hidden(cartManager.items.isEmpty)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Вы уверены, что хотите очистить корзину?"),
                message: Text(""),
                primaryButton: .destructive(Text("Да")) {
                    cartManager.clearCart()
                },
                secondaryButton: .cancel()
            )
        }
        .embedInNavigationStack()
    }
}

extension CartScreen {
    @ViewBuilder
    func cartItemView(_ cartItem: CartItem) -> some View {
        HStack (alignment: .center, spacing: 8) {
            if let url = URL(string: cartItem.dish.image) {
                WebImageWithValidation(url: url, sceleton: {
                    SceletonView(enabled: true, shape: RoundedRectangle(cornerRadius: 4))
                }, placeholder: {
                    NoImageView()
                })
                .frame(width: 60, height: 60)
                .cornerRadius(12)
            } else {
                NoImageView()
                    .frame(width: 60, height: 60)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(cartItem.dish.name)
                    .fontWeight(.medium)
                
                HStack(spacing: 2) {
                    Text("\(cartItem.dish.calories) ккал")
                        .font(.caption)
                        .foregroundColor(.pink)
//                    
//                    Spacer()
//                    
//                    SelectCountView(count: cartItem.quantity) {
//                        cartManager.addToCart(cartItem.dish)
//                    } onDecrement: {
//                        cartManager.removeFromCart(cartItem.dish)
//                    }
//                    .frame(height: 24)
                }
            }
            
            Spacer()
            
            SelectCountView(count: cartItem.quantity) {
                cartManager.addToCart(cartItem.dish)
            } onDecrement: {
                cartManager.removeFromCart(cartItem.dish)
            }
            .frame(height: 24)
        }
//        .padding(.vertical, 8)
//        .padding(.horizontal, 16)
//        .background(Color(.systemBackground))
    }
}

extension CartScreen {
    @ViewBuilder
    func emptyCartView() -> some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            
            Image("empty_cart")
                .resizable()
                .scaledToFit()
                .frame(height: 140)
                .frame(maxWidth: .infinity)
                .padding(.bottom, 32)
            
            Text("Пока ничего нет")
                .font(.headline)
                .padding(.bottom, 12)
            
            Text("Здесь будут блюда, которые вы решите заказать")
                .font(.subheadline)
                .frame(maxWidth: .infinity)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    CartScreen()
}
