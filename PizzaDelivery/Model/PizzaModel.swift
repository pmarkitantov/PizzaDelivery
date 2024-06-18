//
//  PizzaModel.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 05/01/2024.
//

import Foundation

struct Pizza: Identifiable, Hashable {
    var id: UUID = UUID()
    var name: String
    var imageName: String
    var description: String
    var priceMedium: Double
    var priceLarge: Double
}

enum PizzaSize: String, CaseIterable, Identifiable {
    case medium = "Medium"
    case large = "Large"
    
    var id: String { self.rawValue }
}

