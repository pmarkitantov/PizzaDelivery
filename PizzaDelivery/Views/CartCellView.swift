//
//  CartCellView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 12/01/2024.
//

import SwiftUI

struct CartCellView: View {
    @ObservedObject var cartViewModel: CartViewModel
    var cartItem: CartItem

    var totalPrice: Double {
        return Double(cartItem.quantity) * cartItem.price
    }

    var body: some View {
        HStack {
            Image(cartItem.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 70)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(cartItem.name)
                    .font(.headline)
                Text("Price: $\(totalPrice, specifier: "%.2f")")
                    .font(.subheadline)
            }

            Spacer()

            Button {
                cartViewModel.incrementItem(cartItem.name, size: cartItem.size)
            } label: {
                Image(systemName: "plus.circle")
                    .foregroundStyle(.green)
                    .font(.title3)
            }

            Text("\(cartItem.quantity)")
                .font(.title3)

            Button {
                cartViewModel.removeProduct(cartItem.name, size: cartItem.size)
            } label: {
                Image(systemName: "minus.circle")
                    .foregroundStyle(.red)
                    .font(.title3)
            }
        }
        .padding()
        .background(Color("textColor"))
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    CartCellView(cartViewModel: CartViewModel(), cartItem: CartItem(name: "Cheese", size: .medium, price: 14.99, quantity: 2, imageName: "cheese"))
}
