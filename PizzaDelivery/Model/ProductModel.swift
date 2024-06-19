//
//  ProductModel.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 19/06/2024.
//

import Foundation

import SwiftUI

struct MenuSection: Codable, Identifiable, Hashable {
    var id: UUID
    let title: String
    let imageName: String
    let products: [Product]

    init(id: UUID = UUID(), title: String, imageName: String, products: [Product]) {
        self.id = id
        self.title = title
        self.imageName = imageName
        self.products = products
    }

    enum CodingKeys: String, CodingKey {
        case title
        case imageName
        case products
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.title = try container.decode(String.self, forKey: .title)
        self.imageName = try container.decode(String.self, forKey: .imageName)
        self.products = try container.decode([Product].self, forKey: .products)
    }
}

struct Product: Identifiable, Codable, Hashable {
    var id: UUID
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
        case name
        case imageName
        case description
        case priceMedium
        case priceLarge
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.name = try container.decode(String.self, forKey: .name)
        self.imageName = try container.decode(String.self, forKey: .imageName)
        self.description = try container.decode(String.self, forKey: .description)
        self.priceMedium = try container.decode(Double.self, forKey: .priceMedium)
        self.priceLarge = try container.decode(Double.self, forKey: .priceLarge)
    }
}

enum PizzaSize: String, CaseIterable, Identifiable {
    case medium = "Medium"
    case large = "Large"

    var id: String { self.rawValue }
}
