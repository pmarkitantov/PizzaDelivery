//
//  PizzaModel.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 05/01/2024.
//

import Foundation

struct Pizza: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var imageName: String
}
