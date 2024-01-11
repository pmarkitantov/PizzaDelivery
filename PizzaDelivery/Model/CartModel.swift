//
//  CartModel.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 11/01/2024.
//

import Foundation

class CartManager: ObservableObject {
    static let shared = CartManager()
    @Published var pizzasInCart: [String: (pizza: Pizza, count: Int)] = [:]

    func addPizza(_ pizza: Pizza) {
        if let existing = pizzasInCart[pizza.name] {
            pizzasInCart[pizza.name] = (pizza, existing.count + 1)
        } else {
            pizzasInCart[pizza.name] = (pizza, 1)
        }
    }

    func removePizza(_ key: String) {
        if let existing = pizzasInCart[key], existing.count > 1 {
            pizzasInCart[key] = (existing.pizza, existing.count - 1)

        } else {
            pizzasInCart.removeValue(forKey: key)
        }
    }

    init() {
        // Добавление тестовых данных
        let mockPizzas = [
            Pizza(name: "Margherita", price: 10.99, imageName: "margherita"),
            Pizza(name: "Pepperoni", price: 12.99, imageName: "pepperoni"),
            Pizza(name: "Pepperoni", price: 12.99, imageName: "pepperoni")
        ]

        for pizza in mockPizzas {
            addPizza(pizza)
        }
    }
}
