//
//  CartViewModel.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 19/06/2024.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var itemsInCart = [CartItem]()
    
    func addProduct(_ product: Product, amount: Int, size: PizzaSize) {
        if let index = itemsInCart.firstIndex(where: { $0.name == product.name && $0.size == size }) {
            itemsInCart[index].quantity += amount
        } else {
            let price = size == .medium ? product.priceMedium : product.priceLarge
            let cartItem = CartItem(name: product.name, size: size, price: price, quantity: amount, imageName: product.imageName)
            itemsInCart.append(cartItem)
        }
    }
    
    func removeProduct(_ productName: String, size: PizzaSize) {
        if let index = itemsInCart.firstIndex(where: { $0.name == productName && $0.size == size }) {
            itemsInCart[index].quantity -= 1
            if itemsInCart[index].quantity <= 0 {
                itemsInCart.remove(at: index)
            }
        }
    }
    
    func incrementItem(_ productName: String, size: PizzaSize) {
        if let index = itemsInCart.firstIndex(where: { $0.name == productName && $0.size == size }) {
            itemsInCart[index].quantity += 1
        }
    }
    
    init() {
        
        let mockPizzas = [
            Product(name: "Маргарита", imageName: "margherita", description: "Тесто, сыр, соус", priceMedium: 10.99, priceLarge: 12.99)
        ]
        
        for pizza in mockPizzas {
            addProduct(pizza, amount: 2, size: .large)
        }
    }
}
