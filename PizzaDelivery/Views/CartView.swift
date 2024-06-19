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
            HeaderView(title: "Your Cart")
            Spacer()
            if cartViewModel.itemsInCart.isEmpty {
                EmptyCartView()
                Spacer()
            } else {
                FilledCartView(cartViewModel: cartViewModel, total: total)
            }
        }
    }
}

struct HeaderView: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            .padding()
            Spacer()
        }
    }
}

struct EmptyCartView: View {
    var body: some View {
        Text("Your cart is empty")
            .font(.title)
            .foregroundColor(.gray)
    }
}

struct FilledCartView: View {
    @ObservedObject var cartViewModel: CartViewModel
    let total: Double

    var body: some View {
        VStack {
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

            Button(action: placeOrder) {
                Text("Place Order")
                    .font(.title2)
                    .foregroundStyle(Color.primary)
                    .fontWeight(.semibold)
                    .padding(10)
                    .background(Color("subviewBackground"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary, lineWidth: 2)
                    }
                }
            Spacer()
        }
    }

    func placeOrder() {
        for item in cartViewModel.itemsInCart {
            print("Item: \(item.name), Quantity: \(item.quantity), Price: \(item.price)")
        }
        cartViewModel.itemsInCart.removeAll()
    }
}

#Preview {
    CartView(cartViewModel: CartViewModel())
}


