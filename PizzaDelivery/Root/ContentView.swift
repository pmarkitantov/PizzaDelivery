//
//  ContentView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 09/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Group {
            if true {
                MainView()
            } else {
                WelcomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
