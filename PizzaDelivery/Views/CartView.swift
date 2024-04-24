//
//  CartView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 11/01/2024.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cart: CartManager = .shared

    var total: Double {
        cart.pizzasInCart.values.reduce(0) { $0 + $1.pizza.price * Double($1.count) }
    }

    var body: some View {
        VStack {
            if cart.pizzasInCart.isEmpty {
                Text("Your cart is empty")
            } else {
                LazyVStack {
                    ForEach(cart.pizzasInCart.keys.sorted(), id: \.self) { key in
                        if let item = cart.pizzasInCart[key] {
                            HStack {
                                CartCellView(cartManager: cart, pizza: item.pizza, count: item.count)
                            }
                        }
                    }
                }

                Text("Total: $\(total, specifier: "%.2f")")
                    .font(.title)
                    .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    CartView()
}
