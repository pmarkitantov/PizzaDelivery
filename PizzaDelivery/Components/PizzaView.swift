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
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .padding()
            }
            Text(pizza.name)
                .font(.system(.body, design: .rounded))
                .fontWeight(.bold)
            HStack {
                Text(String(format: "%.2f", pizza.price))
                    .font(.system(size: 25))
                Spacer(minLength: 10)
                Button {
                    CartManager.shared.addPizza(pizza)
                    print(CartManager.shared.pizzasInCart.count)
                    showAddedToCartMessage = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        showAddedToCartMessage = false
                    }
                } label: {
                    Image(systemName: showAddedToCartMessage ? "checkmark.circle.fill" : "plus.circle.fill")
                        .foregroundColor(showAddedToCartMessage ? .green : .red)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .animation(.easeInOut, value: showAddedToCartMessage)
                }
            }
            .padding()
        }
        .frame(minWidth: 150)
        .background(Color("textColor"))
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    PizzaView(pizza: Pizza(name: "Chicken BBQ", price: 12.99, imageName: "bbq"))
}
