//
//  PizzaDeliveryApp.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 27/12/2023.
//

import SwiftUI

@main
struct PizzaDeliveryApp: App {
    @StateObject private var cartViewModel = CartViewModel()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(cartViewModel)
        }
    }
}
