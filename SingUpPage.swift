//
//  SingUpPage.swift
//  Haptics
//
//  Created by Mohammed on 16/11/1444 AH.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SingUpPage: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    @State var repassword = ""
    @State var showAlertPassword = false
    @State var showAlert = false
    let myHabtic = UIImpactFeedbackGenerator(style: .rigid)
        
        init() {
            myHabtic.prepare()
        }
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .frame(width: 50 , height: 50)
                .foregroundColor(.orange)
                .padding()
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            TextField("First name", text: $firstName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 10)
            TextField("Last name", text: $lastName)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 10)
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
            SecureField("Re-Password", text: $repassword)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 20)
            Button(action: {
              if password != repassword {
                    showAlertPassword = true
                } else {
                    showAlert = true
                    signUp()
                    myHabtic.impactOccurred()
                }
                
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
        
        .alert(isPresented: $showAlertPassword) {
            Alert(title: Text("Error"), message: Text("the password dose not MATCH! "), dismissButton: .default(Text("OK")))
        }
        
        
        .padding()
        .navigationBarTitle("Create Account")
    }
    
    
    func signUp(){
        Auth.auth().createUser(withEmail: email, password: password){ re , errors in
            if errors != nil{
                print(errors!.localizedDescription )
            } else {
                print(re!.description)
            }
        }
    }
}


struct SingUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SingUpPage()
    }
}
