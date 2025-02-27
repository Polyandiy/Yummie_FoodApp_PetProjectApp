//
//  MainScreen.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 26.02.2025.
//

import SwiftUI

struct MainScreen: View {
    @StateObject private var viewModel = MainScreenViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                VStack(spacing: 5) {
                    Text("Привет!")
                        .font(.title)
                        .foregroundColor(.pink)
                    
                    Text("Хочешь есть здоровую еду?")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    var categories = viewModel.allDishes?.categories ?? []
                    SectionTitleView(title: "Категории \(categories.count)", action: nil)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(categories) { dish in
                                CategoryView(dish: dish)
                            }
                        }
                    }
                    .frame(height: 128)
                }
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    SectionTitleView(title: "Популярные блюда", action: nil)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(viewModel.allDishes?.populars ?? []) { dish in
                                NavigationLink(destination: EmptyView()) { //DishDetailView(dish: dish)
                                    PopularDishesView(dish: dish)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .frame(height: 250)
                }
                .padding(.bottom, 8)
                
                SectionTitleView(title: "Рекомендуем", action: nil)
                LazyVStack {
                    ForEach(viewModel.allDishes?.specials ?? []) { dish in
                        RecommendedView(dish: dish)
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.secondarySystemBackground))
        .overlay {
            ErrorView(message: viewModel.error?.stringError ?? "") {
                viewModel.fetchAllDishes()
            }
            .removed(viewModel.error == nil)
        }
        .showProgressView(viewModel.loading, hideContent: true)
        .onAppear {
            viewModel.fetchAllDishes()
        }
    }
}

#Preview {
    MainScreen()
}
