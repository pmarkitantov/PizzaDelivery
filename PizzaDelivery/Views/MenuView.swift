//
//  ContentView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 27/12/2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem()], spacing: 10) {
                ForEach(MockData.menu, id: \.self) { pizza in
                    PizzaView(pizza: pizza)
                        .padding(.horizontal, 10)
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
