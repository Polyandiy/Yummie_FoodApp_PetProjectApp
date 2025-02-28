//
//  NoImageView.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 27.02.2025.
//

import SwiftUI

struct NoImageView: View {
    var body: some View {
        Image("no_photo_icon")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .foregroundColor(.secondary)
    }
}

#Preview {
    NoImageView()
}
