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
                    Text("YAMMI")
                        .font(.title).bold()
                        .foregroundColor(.pink)
                    
                    Text("Хочешь есть здоровую еду?")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    let categories = viewModel.allDishes?.categories ?? []
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
                    let populars = viewModel.allDishes?.populars ?? []
                    SectionTitleView(title: "Популярные блюда", dishes: populars, action: nil)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(populars.prefix(3)) { dish in
                                NavigationLink {
                                    LazyView {
                                        DetailDishScreen(dish: dish)
                                    }
                                } label: {
                                    PopularDishesView(dish: dish)
                                        .frame(width: 180)
                                }
                            }
                        }
                    }
                    .frame(height: 250)
                }
                .padding(.bottom, 8)
                
                let specials = viewModel.allDishes?.specials ?? []
                SectionTitleView(title: "Рекомендуемые", dishes: specials, action: nil)
                LazyVStack {
                    ForEach(specials.prefix(2)) { dish in
                        NavigationLink {
                            LazyView {
                                DetailDishScreen(dish: dish)
                            }
                        } label: {
                            RecommendedView(dish: dish)
                        }
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
        .embedInNavigationStack()
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
