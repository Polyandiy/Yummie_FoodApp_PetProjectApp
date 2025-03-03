//
//  WebImage+Sceleton.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 27.02.2025.
//

import SwiftUI
import SDWebImageSwiftUI

final class InvalidURLCache {
    static var shared = InvalidURLCache()
    private(set) var invalidURLs = Set<String>()
    
    func addInvalidURL(_ url: String) {
        invalidURLs.insert(url)
    }
    
    func contains(_ url: String) -> Bool {
        invalidURLs.contains(url)
    }
}

struct WebImageWithValidation<Sceleton: View, Placeholder: View>: View {
    private let url: URL?
    private let sceleton: () -> Sceleton
    private let placeholder: () -> Placeholder
    
    @State private var isImageValid: Bool? = nil
    private var cache: InvalidURLCache { InvalidURLCache.shared }
    
    init(url: URL?, @ViewBuilder sceleton: @escaping () -> Sceleton, @ViewBuilder placeholder: @escaping () -> Placeholder) {
        self.url = url
        self.sceleton = sceleton
        self.placeholder = placeholder
    }
    
    var body: some View {
        Group {
            if let url = url {
                if isImageValid == true {
                    WebImage(url: url, sceleton: sceleton, placeholder: placeholder)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else if isImageValid == false {
                    placeholder()
                } else {
                    sceleton()
                        .onAppear {
                            checkURLValidity(url)
                        }
                }
            } else {
                placeholder()
            }
        }
    }
    
    private func checkURLValidity(_ url: URL) {
        let urlString = url.absoluteString
        
        if cache.contains(urlString) {
            isImageValid = false
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "HEAD"
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            DispatchQueue.main.async {
                if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
                    isImageValid = true
                } else {
                    cache.addInvalidURL(urlString)
                    isImageValid = false
                }
            }
        }.resume()
    }
}

extension WebImage {
    init<Sceleton: View, Placeholder: View>(url: URL?, sceleton: @escaping () -> Sceleton, placeholder: @escaping () -> Placeholder)
    where Content == _ConditionalContent<_ConditionalContent<Sceleton, Image>, Placeholder> {
        self.init(url: url) { phase in
            switch phase {
            case .empty:
                sceleton()
            case .success(let image):
                image
            case .failure(_):
                placeholder()
            }
        }
    }
}
