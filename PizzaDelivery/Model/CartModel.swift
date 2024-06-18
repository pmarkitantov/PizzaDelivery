//
//  CartModel.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 11/01/2024.
//

import Foundation

import SwiftUI

struct CartItem: Identifiable, Hashable {
    var id: UUID = UUID()
    var name: String
    var size: PizzaSize
    var price: Double
    var quantity: Int
    var imageName: String
}




