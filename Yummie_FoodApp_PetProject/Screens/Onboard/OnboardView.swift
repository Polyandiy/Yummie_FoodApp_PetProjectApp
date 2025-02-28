//
//  OnboardView.swift
//  Yummie_FoodApp_PetProject
//
//  Created by Поляндий on 28.02.2025.
//

import SwiftUI

import SwiftUI

struct OnboardView: View {
    let imageName: String
    let title: String
    let description: String
    var showDoneButton = false
    var nextAction: () -> Void

    var body: some View {
        VStack(spacing: 20) {

            Spacer()

            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)

            Text(title)
                .font(.title).bold()

            Text(description)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Button("Get Started") {
                nextAction()
            }
            .buttonStyle(OnboardButtonStyle())
            .removed(!showDoneButton)
            
            Button("Next") {
                nextAction()
            }
            .buttonStyle(OnboardButtonStyle())
            .removed(showDoneButton)
        }
        .padding(40)
    }
}

struct OnboardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .frame(maxWidth: .infinity)
            .font(.title3)
            .background(.pink, in: RoundedRectangle(cornerRadius: 8))
            .foregroundColor(.white)
    }
}

#Preview {
    OnboardView(
        imageName: "Onboard1",
        title: "Fresh Food",
        description: "Order your favourite food from the top restaurants.", nextAction: {

        }
    )
}
