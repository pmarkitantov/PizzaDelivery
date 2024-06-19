//
//  MenuViewModel.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 19/06/2024.
//

import Foundation
import SwiftUI

class MenuViewModel: ObservableObject {
    @Published var menuSections: [MenuSection] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    init() {
        loadMenu()
    }

    func loadMenu() {
        isLoading = true
        errorMessage = nil

        guard let url = Bundle.main.url(forResource: "menu", withExtension: "json") else {
            errorMessage = "Failed to locate menu.json in bundle."
            isLoading = false
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            menuSections = try decoder.decode([MenuSection].self, from: data)
        } catch {
            errorMessage = "Failed to decode menu.json: \(error.localizedDescription)"
            print(error.localizedDescription)
        }

        isLoading = false
    }
}
