//
//  RegisterOrLoginView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 27/12/2023.
//
//
import SwiftUI

struct RegisterOrLoginView: View {
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    @State var isLoginMode = false

    var body: some View {
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
                Text(isLoginMode ? "Already have an account? Log in" : "Enter your email and password for register")
                    .foregroundColor(Color("textColor"))
                    .font(.body)
                    .fontWeight(.semibold)
                    .padding()

                TextField("Enter your email", text: $userEmail)
                    .padding()
                    .background(Color("textColor"))
                    .cornerRadius(40)
                    .padding()
                SecureField("Enter your password", text: $userPassword)
                    .padding()
                    .background(Color("textColor"))
                    .cornerRadius(40)
                    .padding()
            }
        }
    }
}

#Preview {
    RegisterOrLoginView()
}
