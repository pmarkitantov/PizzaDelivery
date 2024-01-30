//
//  PizzaView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 05/01/2024.
//

import SwiftUI

struct PizzaView: View {
    var pizza: Pizza
    @State private var showAddedToCartMessage = false

    var body: some View {
        VStack {
            if let pizzaImage = pizza.imageName {
                Image(pizzaImage)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .padding()
            }
            HStack {
                Text("from")

                Text("$" + String(format: "%.2f", pizza.price))
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
            Text(pizza.name)
                .font(.system(.body, design: .rounded))
                .fontWeight(.bold)
                .padding(.vertical, 5)
            Text(pizza.description)
                .font(.system(.subheadline, design: .rounded))
                .foregroundStyle(.secondary)
                .padding(.vertical, 5)

            Button {
                CartManager.shared.addPizza(pizza)

            } label: {
                Text("Add")
                    .foregroundStyle(Color.primary)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary, lineWidth: 3)
                    }
                    .padding()
            }
        }
        .frame(minWidth: 150)
        .background(Color("textColor"))
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    PizzaView(pizza: Pizza(name: "Margherita", price: 12.99, imageName: "margherita", description: "Тесто, сыр, соус"))
}
