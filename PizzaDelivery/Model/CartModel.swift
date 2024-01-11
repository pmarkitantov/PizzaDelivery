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
