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
                    Divider()

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
                    Button("Continue") {
                        isLoginMode ? loginUser() : registerUser()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(Color("textColor"))
                    .background(Color("heavyGreen"))
                    .cornerRadius(40)
                    .padding()
                }
            }
        }
        .navigationDestination(isPresented: $isSuccessful) {
            ContentView()
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
