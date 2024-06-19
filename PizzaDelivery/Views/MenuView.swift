//
//  ContentView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 27/12/2023.
//

import SwiftUI

struct MenuView: View {
    @StateObject private var viewModel = MenuViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                    } else if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                    } else {
                        ForEach(viewModel.menuSections) { section in
                            VStack(alignment: .leading) {
                                Text(section.title)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .padding(.horizontal)

                                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 10) {
                                    ForEach(section.products) { pizza in
                                        PizzaView(pizza: pizza)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
