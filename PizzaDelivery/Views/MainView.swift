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
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.yellow, for: .tabBar)

            CartView()
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
