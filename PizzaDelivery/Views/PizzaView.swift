//
//  PizzaView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 05/01/2024.
//

import SwiftUI

struct PizzaView: View {
    var pizza: Piza
    @State private var showingDetail = false
    @State private var showAddedToCartMessage = false

    var body: some View {
        VStack {
            Image(pizza.imageName)
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .padding()

            HStack {
                Text("from")

                Text("$" + String(format: "%.2f", pizza.priceMedium))
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
            Text(pizza.name)
                .font(.system(.body, design: .rounded))
                .fontWeight(.bold)
                .padding(.vertical, 5)
            Text(pizza.description)
                .font(.system(.subheadline, design: .rounded))
                .lineLimit(5)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding()

            Spacer()

            Button {
                showingDetail.toggle()

            } label: {
                Text("Add")
                    .foregroundStyle(Color.primary)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary, lineWidth: 3)
                    }
                    .padding()
            }
        }
        
        .background(Color("textColor"))
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .sheet(isPresented: $showingDetail) {
            PizzaDetailView(pizza: pizza)
        }
    }
}

#Preview {
    PizzaView(pizza: Piza(name: "Маргарита", imageName: "bbq", description: "Тесто, сыр. соус", priceMedium: 12.99, priceLarge: 15.99))
}
