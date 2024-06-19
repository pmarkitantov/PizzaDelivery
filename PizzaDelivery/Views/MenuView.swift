//
//  ContentView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 27/12/2023.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var menuViewModel: MenuViewModel

    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack {
                        if menuViewModel.isLoading {
                            LoadingView()
                        } else if let errorMessage = menuViewModel.errorMessage {
                            ErrorView(errorMessage: errorMessage)
                        } else {
                            MenuContentView(viewModel: menuViewModel, proxy: proxy)
                        }
                    }
                    .padding(.horizontal)
                    .id(0)
                }
            }
        }
    }
}

struct LoadingView: View {
    var body: some View {
        ProgressView("Loading...")
    }
}

struct ErrorView: View {
    let errorMessage: String

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "exclamationmark.triangle")
                .foregroundColor(.red)
                .font(.largeTitle)
            Text("Oops! Something went wrong.")
                .font(.headline)
                .foregroundColor(.red)
            Text(errorMessage)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
            Text("Please check your internet connection or try again later.")
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .font(.subheadline)
        }
        .padding()
        .background(Color.red.opacity(0.1))
        .cornerRadius(10)
        .padding(.horizontal, 20)
    }
}



struct MenuContentView: View {
    let viewModel: MenuViewModel
    let proxy: ScrollViewProxy

    var body: some View {
        VStack {
            MenuSectionsScrollView(menuSections: viewModel.menuSections, proxy: proxy)
                .shadow(radius: 5)
            MenuSectionsContent(menuSections: viewModel.menuSections)
            BackToTopButton(proxy: proxy)
        }
    }
}

struct MenuSectionsScrollView: View {
    let menuSections: [MenuSection]
    let proxy: ScrollViewProxy

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(menuSections.indices, id: \.self) { index in
                    let section = menuSections[index]
                    Button(action: {
                        withAnimation {
                            proxy.scrollTo(index, anchor: .top)
                        }
                    }) {
                        HStack {
                            Text(section.title)
                                .foregroundStyle(Color.primary)
                                .fontWeight(.semibold)
                                .padding(10)
                                .background(Color("subviewBackground"))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.primary, lineWidth: 2)
                                }
                        }
                    }
                }
            }
            .padding(.horizontal, 5)
        }
        .padding(.vertical)
    }
}

struct MenuSectionsContent: View {
    let menuSections: [MenuSection]

    var body: some View {
        ForEach(menuSections.indices, id: \.self) { index in
            let section = menuSections[index]
            VStack(alignment: .leading) {
                Text(section.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .id(index)

                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 15) {
                    ForEach(section.products) { pizza in
                        PizzaView(pizza: pizza)
                    }
                }
            }
        }
    }
}

struct BackToTopButton: View {
    let proxy: ScrollViewProxy

    var body: some View {
        Button(action: {
            withAnimation {
                proxy.scrollTo(0, anchor: .top)
            }
        }) {
            HStack {
                Text("Back to top")
                Image(systemName: "arrow.up")
            }
            .foregroundStyle(Color.primary)
            .fontWeight(.semibold)
            .padding(10)
            .background(Color("subviewBackground"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.primary, lineWidth: 2)
            }
        }
        .padding()
    }
}

#Preview {
    MenuView(menuViewModel: MenuViewModel())
}
