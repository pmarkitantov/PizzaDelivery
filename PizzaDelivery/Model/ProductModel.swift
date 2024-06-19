//
//  ProductModel.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 19/06/2024.
//

import Foundation

import SwiftUI

struct MenuSection: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    let title: String
    let imageName: String
    let products: [Product]

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageName
        case products
    }

    init(id: UUID = UUID(), title: String, imageName: String, products: [Product]) {
        self.id = id
        self.title = title
        self.imageName = imageName
        self.products = products
    }
}

struct Product: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    var name: String
    var imageName: String
    var description: String
    var priceMedium: Double
    var priceLarge: Double

    init(id: UUID = UUID(), name: String, imageName: String, description: String, priceMedium: Double, priceLarge: Double) {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.description = description
        self.priceMedium = priceMedium
        self.priceLarge = priceLarge
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageName
        case description
        case priceMedium
        case priceLarge
    }
}

enum PizzaSize: String, CaseIterable, Identifiable {
    case medium = "Medium"
    case large = "Large"
    
    var id: String { self.rawValue }
}


