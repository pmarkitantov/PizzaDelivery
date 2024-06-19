//
//  PizzaView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 05/01/2024.
//

import SwiftUI

struct PizzaView: View {
    var pizza: Product
    @State private var showingDetail = false
    @State private var showAddedToCartMessage = false

    var body: some View {
        VStack {
            PizzaImageView(imageName: pizza.imageName)
            PriceView(price: pizza.priceMedium)
            PizzaNameView(name: pizza.name)
            PizzaDescriptionView(description: pizza.description)
            NavigationLinkButton(destination: PizzaDetailView(pizza: pizza))
        }
        .frame(width: 170)
        .background(Color("subviewBackground"))
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

struct PizzaImageView: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .padding(.top, 10)
    }
}

struct PriceView: View {
    let price: Double

    var body: some View {
        HStack {
            Text("from")
            Text("$" + String(format: "%.2f", price))
                .font(.system(size: 16))
                .fontWeight(.bold)
        }
    }
}

struct PizzaNameView: View {
    let name: String

    var body: some View {
        Text(name)
            .font(.system(.body, design: .rounded))
            .fontWeight(.bold)
            .padding(.top, 5)
    }
}

struct PizzaDescriptionView: View {
    let description: String

    var body: some View {
        Text(description)
            .font(.system(.subheadline, design: .rounded))
            .lineLimit(4)
            .multilineTextAlignment(.center)
            .foregroundStyle(.secondary)
            .frame(maxHeight: 80)
    }
}

struct NavigationLinkButton<Destination: View>: View {
    let destination: Destination

    var body: some View {
        NavigationLink(destination: destination) {
            Image(systemName: "plus")
                .foregroundStyle(Color.primary)
                .fontWeight(.semibold)
                .padding(5)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary, lineWidth: 2)
                }
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    PizzaView(pizza: Product(name: "Маргарита", imageName: "bbq", description: "Тесто, сыр. соус", priceMedium: 12.99, priceLarge: 15.99))
}
