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
            Pizza(name: "Margherita", price: 10.99, imageName: "margherita", description: "Тесто, сыр, соус"),
            Pizza(name: "Pepperoni", price: 12.99, imageName: "pepperoni", description: "Тесто, сыр, соус"),
            Pizza(name: "Pepperoni", price: 12.99, imageName: "pepperoni", description: "Тесто, сыр, соус")
        ]
    
        for pizza in mockPizzas {
            addPizza(pizza)
        }
     }
}

struct Piza: Identifiable, Hashable {
    var id: UUID = UUID()
    var name: String
    var imageName: String
    var description: String
    var priceMedium: Double
    var priceLarge: Double
}
struct CartItem: Identifiable, Hashable {
    var id: UUID = UUID()
    var name: String
    var size: PizzaSize
    var price: Double
    var quantity: Int
    var imageName: String
}

enum PizzaSize: String, CaseIterable, Identifiable {
    case medium = "Medium"
    case large = "Large"

    var id: String { self.rawValue }
}

class CartManagers: ObservableObject {
    static let shared = CartManagers()
    @Published var itemsInCart = [CartItem]()
    
    func addPizza(pizza: Piza, amount: Int, pizzaSize: PizzaSize) {
        // Проверяем, есть ли уже такой элемент в корзине
        if let index = itemsInCart.firstIndex(where: { $0.name == pizza.name && $0.size == pizzaSize }) {
            // Увеличиваем количество
            itemsInCart[index].quantity += amount
        } else {
            // Создаем новый элемент, если его нет в корзине
            let price = pizzaSize == .medium ? pizza.priceMedium : pizza.priceLarge
            let cartItem = CartItem(name: pizza.name, size: pizzaSize, price: price, quantity: amount, imageName: pizza.imageName)
            itemsInCart.append(cartItem)
        }
    }
    
    func removePizza(pizzaName: String, pizzaSize: PizzaSize) {
            if let index = itemsInCart.firstIndex(where: { $0.name == pizzaName && $0.size == pizzaSize }) {
                itemsInCart[index].quantity -= 1
                if itemsInCart[index].quantity <= 0 {
                    itemsInCart.remove(at: index)
                }
            }
        }
    
    func incrementItem(pizzaName: String, pizzaSize: PizzaSize) {
            if let index = itemsInCart.firstIndex(where: { $0.name == pizzaName && $0.size == pizzaSize }) {
                itemsInCart[index].quantity += 1
            }
        }
    
    init() {
       // Добавление тестовых данных
       let mockPizzas = [
        Piza(name: "Маргарита", imageName: "bbq", description: "Тесто, сыр. соус", priceMedium: 12.99, priceLarge: 15.99)
           
       ]
   
       for pizza in mockPizzas {
           addPizza(pizza: pizza, amount: 2, pizzaSize: .large)
       }
    }
}



