//
//  TestDetailView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 30/01/2024.
//

import SwiftUI

struct PizzaDetailView: View {
    var pizza: Product
    @Environment(\.dismiss) var dismiss
    @State private var size: PizzaSize = .medium
    @State private var count = 1
    @EnvironmentObject var cartViewModel: CartViewModel
    @State private var buttonLabel = "Add to Cart"

    var body: some View {
        NavigationStack {
            ZStack {
                Color("subviewBackground")
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
            .overlay(alignment: .topLeading) {
                backButton
            }
            .navigationBarBackButtonHidden()
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
                cartViewModel.addProduct(pizza, amount: count, size: size)
                buttonLabel = "Added!"
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        buttonLabel = "Add to Cart"
                    }
                }
            }
        } label: {
            Text(buttonLabel)
                .font(.title)
                .fontDesign(.rounded)
                .foregroundStyle(buttonLabel == "Added!" ? Color.green : Color.primary)
                .fontWeight(.semibold)
                .padding(.horizontal, 50)
                .padding(.vertical, 10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(buttonLabel == "Added!" ? Color.green : Color.primary, lineWidth: 3)
                }
        }
    }

    private func priceForSize() -> Double {
        size == .medium ? pizza.priceMedium : pizza.priceLarge
    }

    private var backButton: some View {
        Button {
            dismiss()
        }
        label: {
            Image(systemName: "chevron.down")
                .font(.headline)
                .padding(16)
                .foregroundStyle(.red)
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 4)
                .padding()
        }
    }
}

#Preview {
    PizzaDetailView(pizza: Product(name: "Маргарита", imageName: "bbq", description: "Тесто, сыр. соус", priceMedium: 12.99, priceLarge: 15.99))
        .environmentObject(CartViewModel())
}
