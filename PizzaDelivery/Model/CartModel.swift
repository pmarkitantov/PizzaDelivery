//
//  CartModel.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 11/01/2024.
//

import Foundation

class Cart: ObservableObject {
    @Published var pizzasInCart: [Pizza] = []
}

class CartManager: ObservableObject {
    static let shared = CartManager() // Создаем единственный экземпляр
    
    @Published var pizzasInCart: [Pizza] = [Pizza(name: "Chicken", price: 12.99, imageName: "bbq")]
    
    func addPizza(pizza : Pizza) {
        pizzasInCart.append(pizza)
    }

    private init() {} // Приватный инициализатор, чтобы предотвратить создание дополнительных экземпляров
}

