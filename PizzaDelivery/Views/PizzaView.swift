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
            Image(pizza.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(.top, 10) // Верхний отступ для изображения

            HStack {
                Text("from")
                Text("$" + String(format: "%.2f", pizza.priceMedium))
                    .font(.system(size: 16))
                    .fontWeight(.bold)
            }
            
            Text(pizza.name)
                .font(.system(.body, design: .rounded))
                .fontWeight(.bold)
                .padding(.top, 5) 

            Text(pizza.description)
                .font(.system(.subheadline, design: .rounded))
                .lineLimit(4)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .frame(maxHeight: 80) // Ограничиваем максимальную высоту текста
            
            NavigationLink(destination: {
                PizzaDetailView(pizza: pizza)
            }, label: {
                Image(systemName: "cart")
                    .foregroundStyle(Color.primary)
                    .fontWeight(.semibold)
                    .padding(5)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primary, lineWidth: 2)
                    }
            })
            .padding(.bottom, 10) // Нижний отступ для кнопки
        }
        .frame(width: 170)
        .background(Color("subviewBackground"))
        .clipShape(RoundedRectangle(cornerRadius: 25))
        
    }
}


#Preview {
    PizzaView(pizza: Product(name: "Маргарита", imageName: "bbq", description: "Тесто, сыр. соус", priceMedium: 12.99, priceLarge: 15.99))
}
