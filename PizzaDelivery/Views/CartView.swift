//
//  CartView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 11/01/2024.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cartViewModel: CartViewModel

    var total: Double {
        cartViewModel.itemsInCart.reduce(0) { $0 + $1.price * Double($1.quantity) }
    }

    var body: some View {
        VStack {
            if cartViewModel.itemsInCart.isEmpty {
                Text("Your cart is empty")
            } else {
                LazyVStack {
                    ForEach(cartViewModel.itemsInCart) { item in
                        HStack {
                            CartCellView(cartViewModel: cartViewModel, cartItem: item)
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
    CartView(cartViewModel: CartViewModel())
}


