//
//  LoginView.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 10/4/22.
//

import SwiftUI

struct LoginScreen: View {

    // MARK: - Login Properties
    @State private var user = ""
    @State private var password = ""
    
    @State var openApp = false

    var body: some View {
        NavigationView {
            VStack(spacing: 60){
                Image("Logo")
                    .resizable()
                    .frame(width: 300, height: 130)
                
                VStack(spacing: 30) {

                    // MARK: - Fields Login
                    TextFieldGeneral(defaultTextFiled: "user_login",
                                     stringTextField: $user)
                    
                    SecureFieldGeneral(defaultTextFiled: "password_login",
                                       stringTextField: $password)

                    // MARK: - Button

                    NavigationLink(
                      destination: ProfileCoachScreen(), isActive: self.$openApp
                    ) {
                        Button(action: {
                            self.openApp.toggle()
                        }) {
                            Text("login_signIn")
                                .font(.system(size: 16))
                                .bold()
                        }.buttonStyle(
                            SmallButtonStyle(textColor: Color.white,
                                             backgroundColor: Color("blueColor"),
                                             disabled: false)
                        )
                    }
                }
            }
            .padding(.top, 100)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
            .navigationBarHidden(true)
            .navigationAppearance(
                backgroundColor: .white, foregroundColor: .black
            )
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
