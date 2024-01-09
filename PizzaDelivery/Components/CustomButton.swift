//
//  CustomButton.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 09/01/2024.
//

import SwiftUI

struct CustomButton: View {
    var imageName: String?
    var text: String
    var destination: AnyView?

    var body: some View {
        NavigationLink(destination: destination) {
            Label(
                title: {
                    Text(text)
                        .font(.title)
                        .fontWeight(.semibold)
                },
                icon: {
                    if let image = imageName {
                        Image(systemName: image)
                            .font(.title)
                    }
                }
            )
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(Color("textColor"))
            .background(Color("heavyGreen"))
            .cornerRadius(40)
            .padding()
        }
    }
}

#Preview {
    CustomButton(text: "Custom Button")
}
