//
//  TestPage.swift
//  Haptics
//
//  Created by Mohammed on 17/11/1444 AH.
//

import SwiftUI

struct TestPage: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("successfully Loged in😍")
                NavigationLink(destination: {
                    LoginPage()
                }) {
                    Text("Sign out")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                        .navigationBarBackButtonHidden(true)
                }
                
                .padding()
            }
        }
    }
}

struct TestPage_Previews: PreviewProvider {
    static var previews: some View {
        TestPage()
    }
}
