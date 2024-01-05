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
             Pizza(name: "Phila", price: 15.99, imageName: "bbq")]

    var body: some View {
        List(0 ..< M.count, id: \.self) { index in
            if index % 2 == 0 { // Проверяем, чтобы обрабатывать каждый второй элемент
                HStack {
                    PizzaView(pizza: M[index])
                    if index + 1 < M.count { // Убедимся, что следующий индекс не выходит за границы
                        PizzaView(pizza: M[index + 1])
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color("primaryOrange"))
            }
        }

        .background(Color("primaryOrange"))
        .listStyle(.plain)
    }
}

#Preview {
    MenuView()
}
