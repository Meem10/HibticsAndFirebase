//
//  LoginPage.swift
//  Haptics
//
//  Created by Mohammed on 16/11/1444 AH.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginPage: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var showingAlert = false
    let myHabtic = UIImpactFeedbackGenerator(style: .medium)
        
        init() {
            myHabtic.prepare()
        }
    var body: some View {
        if isLoggedIn == true {
            TestPage()
        }else{
            NavigationView {
                VStack{
                    Image(systemName: "swift")
                        .resizable()
                        .frame(width: 50 , height: 50)
                        .foregroundColor(.orange)
                        .padding()
                    Text("Log In")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                    HStack{
                        Button(action: {
                            logIn()
                            myHabtic.impactOccurred()
                        }) {
                            Text("Sign In")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .cornerRadius(10)
                        }
                        NavigationLink(destination: {
                            SingUpPage()
                        }) {
                            Text("Sign Up")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .cornerRadius(10)
                        }
                    }
                    
                }
                .navigationBarBackButtonHidden(true)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Error"), message: Text("Invalid email or password"), dismissButton: .default(Text("OK")))
                }
                .navigationBarBackButtonHidden(true)
                .padding()
            }
        }
        
    }
    
    func logIn(){
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            if let error = error {
                print("Error logging in: \(error.localizedDescription)")
                showingAlert = true
            } else {
                isLoggedIn = true
            }
        }
    }
}





struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}




