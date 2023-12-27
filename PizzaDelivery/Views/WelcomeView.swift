//
//  WelcomeView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 27/12/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
                    ZStack {
                        Color("primaryOrange")
                            .ignoresSafeArea()
                        VStack {
                            Image("mainLogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300)
                                .clipShape(Circle())
                                .padding(.bottom, 100)
                            Text("Welcome Back!")
                                .foregroundColor(Color("textColor"))
                                .font(.title)
                                .fontWeight(.bold)
                                .padding()
                            Text("Log in using your email or register new account")
                                .foregroundColor(Color("textColor"))
                                .font(.body)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding()
                            
                            CustomNavigationButton(imageName: "square.and.arrow.up", text: "Login", destination: AnyView(RegisterOrLoginView(isLoginMode: true)))
                            CustomNavigationButton(imageName: "square.and.pencil", text: "Register", destination: AnyView(RegisterOrLoginView(isLoginMode: false)))
                        }
                    }
                }
    }
}

struct CustomNavigationButton: View {
    var imageName: String
    var text: String
    var destination: AnyView

    var body: some View {
        NavigationLink(destination: destination) {
            Label(
                title: {
                    Text(text)
                        .font(.title)
                        .fontWeight(.semibold)
                },
                icon: {
                    Image(systemName: imageName)
                        .font(.title)
                }
            )
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(Color("textColor"))
            .background(Color("heavyGreen"))
            .cornerRadius(40)
            .padding()
        }
    }
}

#Preview {
    WelcomeView()
}
