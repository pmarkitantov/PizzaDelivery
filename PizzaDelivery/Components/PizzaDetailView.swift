//
//  TestDetailView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 30/01/2024.
//

import SwiftUI

struct PizzaDetailView: View {
    var pizza: Piza
    @State var size: PizzaSize = .medium
    @State var count = 1

    var body: some View {
        NavigationStack {
            ZStack {
                Color("textColor")
                    .ignoresSafeArea()
                VStack {
                    Image(pizza.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .scaleEffect(1.1)
                        .offset(y: 5)
                        .clipShape(Circle())
                    Text(pizza.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .padding()
                    Text(pizza.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .fontDesign(.rounded)

                    Picker("Choose pizza's size", selection: $size) {
                        ForEach(PizzaSize.allCases) { size in
                            Text(size.rawValue).tag(size)
                                .fontDesign(.rounded)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()

                    HStack {
                        Text("Price: $\(size == .medium ? pizza.priceMedium : pizza.priceLarge, specifier: "%.2f")")
                            .fontWeight(.bold)
                            .font(.title2)
                            .padding()
                        Spacer()
                        HStack {
                            Button {
                                count -= 1
                                if count <= 0 {
                                    count = 1
                                }
                            } label: {
                                Image(systemName: "minus.circle")
                                    .foregroundStyle(.red)
                                    .font(.title3)
                            }

                            Text("\(count)")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .fontDesign(.rounded)
                                .padding(.horizontal, 5)

                            Button {
                                count += 1
                            } label: {
                                Image(systemName: "plus.circle")
                                    .foregroundStyle(.green)
                                    .font(.title3)
                            }
                        }
                    }
                    .padding(.horizontal, 20)

                    Button {
                        CartManagers.shared.addPizza(pizza: pizza, amount: count, pizzaSize: size)
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
                    }
                }
                .onChange(of: size) { _ in
                    count = 1
                }
            }
            .navigationBarBackButtonHidden(false)
        }
    }
}

#Preview {
    PizzaDetailView(pizza: Piza(name: "Маргарита", imageName: "bbq", description: "Тесто, сыр. соус", priceMedium: 12.99, priceLarge: 15.99))
}
