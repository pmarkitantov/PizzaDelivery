//
//  CartViewModel.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 19/06/2024.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var itemsInCart = [CartItem]()
    
    func addPizza(_ pizza: Pizza, amount: Int, size: PizzaSize) {
        if let index = itemsInCart.firstIndex(where: { $0.name == pizza.name && $0.size == size }) {
            itemsInCart[index].quantity += amount
        } else {
            let price = size == .medium ? pizza.priceMedium : pizza.priceLarge
            let cartItem = CartItem(name: pizza.name, size: size, price: price, quantity: amount, imageName: pizza.imageName)
            itemsInCart.append(cartItem)
        }
    }
    
    func removePizza(_ pizzaName: String, size: PizzaSize) {
        if let index = itemsInCart.firstIndex(where: { $0.name == pizzaName && $0.size == size }) {
            itemsInCart[index].quantity -= 1
            if itemsInCart[index].quantity <= 0 {
                itemsInCart.remove(at: index)
            }
        }
    }
    
    func incrementItem(_ pizzaName: String, size: PizzaSize) {
        if let index = itemsInCart.firstIndex(where: { $0.name == pizzaName && $0.size == size }) {
            itemsInCart[index].quantity += 1
        }
    }
    
    init() {
        // Adding mock data for testing
        let mockPizzas = [
            Pizza(name: "Маргарита", imageName: "margherita", description: "Тесто, сыр, соус", priceMedium: 10.99, priceLarge: 12.99)
        ]
        
        for pizza in mockPizzas {
            addPizza(pizza, amount: 2, size: .large)
        }
    }
}
