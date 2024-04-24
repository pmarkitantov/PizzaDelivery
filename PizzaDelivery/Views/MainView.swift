//
//  MainView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 05/01/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            NavigationView {
                MenuView()
                    .navigationBarTitle("Find your best pizza!")
            }
            .tabItem {
                Label("Menu", systemImage: "list.dash")
            }
            

            NavigationView {
                CartView()
                    .navigationBarTitle("Cart")
            }
            .tabItem {
                Label("Cart", systemImage: "cart")
            }
        }
        .tint(.primary)
    }
}

#Preview {
    MainView()
}
