//
//  PizzaDeliveryApp.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 27/12/2023.
//

import FirebaseAuth
import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
    {
        FirebaseApp.configure()

        return true
    }
}

@main
struct PizzaDeliveryApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            if true {
                MainView()
            } else {
                WelcomeView()
            }
        }
    }
}
