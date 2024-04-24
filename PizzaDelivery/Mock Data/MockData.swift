//
//  MockData.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 11/01/2024.
//

import Foundation
struct MockData {
    
    static var menu = [
        Piza(name: "Margherita", imageName: "margherita", description: "Classic tomato sauce, mozzarella cheese, and fresh basil", priceMedium: 12.99, priceLarge: 15.99),
        Piza(name: "Cheese", imageName: "cheese", description: "Classic tomato sauce, mozzarella cheese, cheddar, and parmesan cheeses", priceMedium: 14.99, priceLarge: 17.99),
        Piza(name: "BBQ", imageName: "bbq", description: "BBQ sauce, grilled chicken, bacon, onions, and mozzarella cheese", priceMedium: 15.99, priceLarge: 18.99),
        Piza(name: "Phila", imageName: "phila", description: "Creamy white sauce, sliced steak, onions, green peppers, and mushrooms", priceMedium: 15.99, priceLarge: 18.99),
        Piza(name: "Hawaiian", imageName: "hawaii", description: "Tomato sauce, mozzarella cheese, ham, and pineapple", priceMedium: 15.99, priceLarge: 18.99),
        Piza(name: "Pepperoni", imageName: "pepperoni", description: "Tomato sauce, mozzarella cheese, and extra pepperoni", priceMedium: 15.99, priceLarge: 18.99)
    ]

}
