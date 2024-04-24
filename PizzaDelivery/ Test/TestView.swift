//
//  TestView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 30/01/2024.
//

import SwiftUI

struct TestView: View {
    @ObservedObject var cartManager: CartManagers = .shared
    var pizza: Piza
    var size: PizzaSize
    var count: Int
    var totalPrice: Double {
        return Double(count) * (size == .medium ? pizza.priceMedium : pizza.priceLarge)
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
                Text(pizza.name + " (\(size.rawValue))")
                    .font(.headline)
                Text("Price: $\(size == .medium ? pizza.priceMedium : pizza.priceLarge, specifier: "%.2f")")
                    .font(.subheadline)
            }

            Spacer()

            Button {
                cartManager.addPizza(pizza, size: size)
            } label: {
                Image(systemName: "plus.circle")
                    .foregroundStyle(.green)
                    .font(.title3)
            }

            Text("\(count)")
                .font(.title3)
            
            Button {
                cartManager.removePizza(pizza, size: size)
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
    TestView(cartManager: CartManagers.shared, pizza: Piza(name: "TestPizza", imageName: "bbq", description: "Тесто, соус, сыр", priceMedium: 12.99, priceLarge: 16.99), size: .medium, count: 2)
}
