//
//  WebImage+Sceleton.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 27.02.2025.
//

import SwiftUI
import SDWebImageSwiftUI

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
