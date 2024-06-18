//
//  MainView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 05/01/2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var cartViewModel: CartViewModel
    
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
                CartView(cartViewModel: cartViewModel)
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
        .environmentObject(CartViewModel())
}
