//
//  PizzaView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 05/01/2024.
//

import SwiftUI

struct PizzaView: View {
    var pizza: Pizza

    var body: some View {
        VStack() {
            Image(pizza.imageName)
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding()
            Text(pizza.name)
                .font(.system(.body, design: .rounded))
                .fontWeight(.bold)
            HStack {
                Text(String(format: "%.2f", pizza.price))
                    .font(.system(size: 25))
                Spacer(minLength: 10)
                Button(action: {
                    // Действие добавления пиццы
                }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.red)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
            }
            .padding()
        }
        .frame(minWidth: 150, maxWidth: .infinity)
        .background(Color("textColor"))
        .clipShape(RoundedRectangle(cornerRadius: 25))
        
        
    }
}

#Preview {
    PizzaView(pizza: Pizza(name: "Chicken BBQ", price: 12.99, imageName: "bbq"))
}
