//
//  PizzaDeliveryApp.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 27/12/2023.
//


import SwiftUI


@main
struct PizzaDeliveryApp: App {

    var body: some Scene {
        WindowGroup {
            if true {
                MainView()
            } else {
                WelcomeView()
            }
        }
    }
}
