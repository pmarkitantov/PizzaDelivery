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
                            
                            CustomButton(imageName: "square.and.arrow.up", text: "Login", destination: AnyView(RegisterOrLoginView(isLoginMode: true)))
                            CustomButton(imageName: "square.and.pencil", text: "Register", destination: AnyView(RegisterOrLoginView(isLoginMode: false)))
                        }
                    }
                }
    }
}



#Preview {
    WelcomeView()
}
