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
                    SectionTitleView(title: "Категории", count: categories.count, action: nil)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(categories.prefix(4)) { dish in
                                CategoryView(dish: dish)
                            }
                        }
                    }
                    .frame(height: 128)
                }
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    let populars = viewModel.allDishes?.populars ?? []
                    SectionTitleView(title: "Популярные блюда", count: populars.count, action: nil)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(populars.prefix(3)) { dish in
                                PopularDishesView(dish: dish)
                                    .background {
                                        navigationLink(destination: DetailDishScreen(dish: dish))
                                    }
                            }
                        }
                    }
                    .frame(height: 250)
                }
                .padding(.bottom, 8)
                
                let specials = viewModel.allDishes?.specials ?? []
                SectionTitleView(title: "Рекомендуем", count: specials.count, action: nil)
                LazyVStack {
                    ForEach(specials.prefix(2)) { dish in
                        RecommendedView(dish: dish)
                            .background {
                                navigationLink(destination: DetailDishScreen(dish: dish))
                            }
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

extension MainScreen {
    @ViewBuilder
    func navigationLink<Destination: View>(destination: Destination) -> some View {
        NavigationLink.EmptyLabel() {
            LazyView {
                destination
            }
        }
        .opacity(0)
    }
}

#Preview {
    MainScreen()
}
