//
//  ContentView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 27/12/2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {

            VStack {
                HStack {
                    Text("Find you best pizza!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .padding()
                    Spacer()
                }

                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: 20) {
                        ForEach(MockData.menu, id: \.self) { pizza in
                            PizzaView(pizza: pizza)
                        }
                    }
                }

                .padding()
            }
        
    }
}

#Preview {
    MenuView()
}
