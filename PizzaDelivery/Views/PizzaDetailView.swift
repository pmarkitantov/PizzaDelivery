//
//  TestDetailView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 30/01/2024.
//

import SwiftUI

struct PizzaDetailView: View {
    var pizza: Piza
    @State private var size: PizzaSize = .medium
    @State private var count = 1
    @EnvironmentObject var cartViewModel: CartViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                Color("textColor")
                    .ignoresSafeArea()
                VStack {
                    pizzaImage
                    pizzaInfo
                    pizzaSizePicker
                    pizzaOrderControls
                    addToCartButton
                }
                .onChange(of: size) { _ in count = 1 }
                .padding()
            }
            .navigationBarBackButtonHidden(false)
        }
    }

    private var pizzaImage: some View {
        Image(pizza.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
            .scaleEffect(1.1)
            .offset(y: 5)
            .clipShape(Circle())
    }

    private var pizzaInfo: some View {
        VStack {
            Text(pizza.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .padding()
            Text(pizza.description)
                .font(.body)
                .foregroundColor(.secondary)
                .fontDesign(.rounded)
        }
    }

    private var pizzaSizePicker: some View {
        Picker("Choose pizza's size", selection: $size) {
            ForEach(PizzaSize.allCases) { size in
                Text(size.rawValue).tag(size)
                    .fontDesign(.rounded)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }

    private var pizzaOrderControls: some View {
        HStack {
            Text("Price: $\(priceForSize(), specifier: "%.2f")")
                .fontWeight(.bold)
                .font(.title2)
                .padding()
            Spacer()
            HStack {
                decrementButton
                Text("\(count)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .padding(.horizontal, 5)
                incrementButton
            }
        }
        .padding(.horizontal, 20)
    }

    private var decrementButton: some View {
        Button {
            count = max(count - 1, 1)
        } label: {
            Image(systemName: "minus.circle")
                .foregroundStyle(.red)
                .font(.title3)
        }
    }

    private var incrementButton: some View {
        Button {
            count += 1
        } label: {
            Image(systemName: "plus.circle")
                .foregroundStyle(.green)
                .font(.title3)
        }
    }

    private var addToCartButton: some View {
        Button {
            withAnimation {
                cartViewModel.addPizza(pizza, amount: count, size: size)
            }
        } label: {
            Text("Add to Cart")
                .font(.title)
                .fontDesign(.rounded)
                .foregroundStyle(Color.primary)
                .fontWeight(.semibold)
                .padding(.horizontal, 50)
                .padding(.vertical, 10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary, lineWidth: 3)
                }
                .padding()
                .scaleEffect(1.1)
        }
    }

    private func priceForSize() -> Double {
        size == .medium ? pizza.priceMedium : pizza.priceLarge
    }
}

#Preview {
    PizzaDetailView(pizza: Piza(name: "Маргарита", imageName: "bbq", description: "Тесто, сыр. соус", priceMedium: 12.99, priceLarge: 15.99))
        .environmentObject(CartViewModel())
}
