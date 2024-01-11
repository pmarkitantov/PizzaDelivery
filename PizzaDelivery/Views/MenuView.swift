//
//  ContentView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 27/12/2023.
//

import SwiftUI

struct MenuView: View {
    
    var M = [Pizza(name: "Chicken", price: 12.99, imageName: "bbq"),
             Pizza(name: "Cheese", price: 14.99, imageName: "bbq"),
             Pizza(name: "BBQ", price: 15.99, imageName: "bbq"),
             Pizza(name: "Phila", price: 15.99, imageName: "bbq"),
             Pizza(name: "Hawaika", price: 15.99, imageName: "bbq")]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem()], spacing: 20) {
                ForEach(M, id: \.self) { pizza in
                    PizzaView(pizza: pizza)
                }
            }
        }
        .padding()
        .background(Color("primaryOrange"))
    }
}


#Preview {
    MenuView()
}
