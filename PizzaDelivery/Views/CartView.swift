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
        NavigationView {
            Group {
                if cart.pizzasInCart.isEmpty {
                    Text("Your cart is empty")
                } else {
                    List {
                        ForEach(cart.pizzasInCart.keys.sorted(), id: \.self) { key in
                            if let item = cart.pizzasInCart[key] {
                                HStack {
                                    Text(item.pizza.name)
                                    Spacer()

                                    Text("x\(item.count)")

                                    Text("$\(item.pizza.price * Double(item.count), specifier: "%.2f")")
                                    Button(action: {
                                        self.cart.removePizza(key)
                                    }) {
                                        Image(systemName: "minus.circle")
                                            .foregroundStyle(.red)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Cart")
            .navigationBarItems(trailing: Text("Total: $\(total, specifier: "%.2f")"))
        }
    }
}

#Preview {
    CartView()
}
