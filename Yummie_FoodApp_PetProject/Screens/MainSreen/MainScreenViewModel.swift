//
//  MainScreenViewModel.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 26.02.2025.
//

import Foundation
import Combine

class MainScreenViewModel: ObservableObject {
    private let service: NetworkServiceProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var loading: Bool = false
    @Published private(set) var error: NetworkError? = nil
    
    @Published var allDishes: AllDishes?
    
    init(service: NetworkServiceProtocol = NetworkService()) {
        self.service = service
    }
    
    func fetchAllDishes() {
        guard loading == false else { return }
        self.loading = true
    
        let promise = service.request(url: "https://yummie.glitch.me/dish-categories", decodeType: APIResponse.self)
        promise.sink { [weak self] completion in
            guard let self = self else { return }
            switch completion {
            case .failure(let error):
                self.error = error
            default:
                break
            }
            self.loading = false
        } receiveValue: { [weak self] responseData in
            guard let self = self else { return }
            self.allDishes = responseData.data
            self.loading = false
        }
        .store(in: &cancellables)
    }
}
