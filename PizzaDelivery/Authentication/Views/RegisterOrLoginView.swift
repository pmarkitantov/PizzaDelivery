//
//  RegisterOrLoginView.swift
//  PizzaDelivery
//
//  Created by Pavel Markitantov on 27/12/2023.
//
//
import FirebaseAuth
import SwiftUI

struct RegisterOrLoginView: View {
    @State var userEmail: String = ""
    @State var userPassword: String = ""
    @State var isLoginMode = false
    @State var isSuccessful = false

    var body: some View {
        NavigationStack {
            VStack {
                Image("mainLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .clipShape(Circle())
                    .padding(.bottom, 100)
                Text(isLoginMode ? "Already have an account? Log in" : "Enter your email and password for register")
                    .foregroundColor(.primary)
                    .font(.body)
                    .fontWeight(.semibold)
                    .padding()
                    .tint(.black)
                Divider()

                VStack(spacing: 24) {
                    InputView(text: $userEmail,
                              title: "Email adress",
                              placeholder: "name@example.com")
                        .textInputAutocapitalization(.none)

                    InputView(text: $userPassword,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)

                Button("Continue") {
                    isLoginMode ? loginUser() : registerUser()
                    if isSuccessful {}
                }
                .font(.title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(.green)
                .cornerRadius(40)
                .padding()
            }
        }
        .navigationDestination(isPresented: $isSuccessful) {
            MainView()
        }
    }

    func registerUser() {
        Auth.auth().createUser(withEmail: userEmail, password: userPassword) { _, error in
            if error != nil {
                print(error?.localizedDescription ?? "Unknown error")
            } else {
                print("register succesful!")
                isSuccessful = true
            }
        }
    }

    func loginUser() {
        Auth.auth().signIn(withEmail: userEmail, password: userPassword) { _, error in
            if error != nil {
                print(error?.localizedDescription ?? "Unknown error")
            } else {
                print("login succesful")
                isSuccessful = true
            }
        }
    }
}

#Preview {
    RegisterOrLoginView()
}
