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

    private func updatePizzaCount(for pizza: Pizza, by amount: Int) {
        let currentCount = pizzasInCart[pizza.name]?.count ?? 0
        let newCount = max(currentCount + amount, 0)

        if newCount > 0 {
            pizzasInCart[pizza.name] = (pizza, newCount)
        } else {
            pizzasInCart.removeValue(forKey: pizza.name)
        }
    }

    func addPizza(_ pizza: Pizza, count: Int = 1) {
        updatePizzaCount(for: pizza, by: count)
    }

    func removePizza(_ key: String) {
        guard let pizza = pizzasInCart[key]?.pizza else { return }
        updatePizzaCount(for: pizza, by: -1)
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

