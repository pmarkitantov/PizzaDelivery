//
//  CartView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 11/01/2024.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var cart: Cart

    var total: Double {
        cart.pizzasInCart.reduce(0) { $0 + $1.price }
    }

    var body: some View {
        NavigationView {
            Group {
                if cart.pizzasInCart.isEmpty {
                    Text("Your cart is empty")
                } else {
                    List {
                        ForEach(cart.pizzasInCart) { pizza in
                            HStack {
                                Text(pizza.name)
                                Spacer()
                                Text("$\(pizza.price, specifier: "%.2f")")
                                Button(action: {
                                    self.removePizza(pizza)
                                }) {
                                    Image(systemName: "trash")
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

    func removePizza(_ pizza: Pizza) {
            cart.pizzasInCart.removeAll { $0.id == pizza.id }
        }
}

#Preview {
    CartView(cart: Cart())
}
