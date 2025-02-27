//
//  NetworkService.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 26.02.2025.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError(DecodingError)
    case unknown
    case serverError(statusCode: Int)
}

extension NetworkError {
    var stringError: String {
        switch self {
        case .decodingError(let error):
            error.localizedDescription
        case .serverError(statusCode: let statusCode):
            "Ошибка сервера: \(statusCode)"
        default:
            "Что-то пошло не так"
        }
    }
}

protocol NetworkServiceProtocol {
    func request<T: Decodable>(url: String, decodeType: T.Type) -> AnyPublisher<T, NetworkError>
}

final class NetworkService: NetworkServiceProtocol {

    private let session: URLSession
    private var cancellables = Set<AnyCancellable>()

    init(session: URLSession = .shared) {
        self.session = session
    }

    func request<T: Decodable>(url: String, decodeType: T.Type) -> AnyPublisher<T, NetworkError> {
        guard let url = URL(string: url) else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    throw NetworkError.serverError(statusCode: httpResponse.statusCode)
                }
                
                return data
            }
            .decode(type: decodeType, decoder: JSONDecoder())
            .mapError { error in
                switch error {
                case let decodingError as DecodingError:
                    return NetworkError.decodingError(decodingError)
                case let apiError as NetworkError:
                    return apiError
                default:
                    return NetworkError.unknown
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
