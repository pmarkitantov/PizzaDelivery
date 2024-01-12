//
//  CartCellView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 12/01/2024.
//

import SwiftUI

struct CartCellView: View {
    @ObservedObject var cartManager: CartManager
    var pizza: Pizza
    var count: Int
    var totalPrice: Double {
        return Double(count) * pizza.price
    }

    var body: some View {
        HStack {
            if let pizzaImage = pizza.imageName {
                Image(pizzaImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 70)
                    .clipShape(Circle())
            }

            VStack(alignment: .leading) {
                Text(pizza.name)
                    .font(.headline)
                Text("Price: $\(pizza.price, specifier: "%.2f")")
                    .font(.subheadline)
            }

            Spacer()

            Button {
                cartManager.addPizza(pizza)
            } label: {
                Image(systemName: "plus.circle")
                    .foregroundStyle(.green)
                    .font(.title3)
            }

            Text("\(count)")
                .font(.title3)
            
            Button {
                cartManager.removePizza(pizza.name)
            } label: {
                Image(systemName: "minus.circle")
                    .foregroundStyle(.red)
                    .font(.title3)
            }
        }
        .padding()
    }
}

#Preview {
    CartCellView(cartManager: CartManager(), pizza: Pizza(name: "Cheese", price: 14.99, imageName: "cheese"), count: 2)
}
