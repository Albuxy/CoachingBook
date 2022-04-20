//
//  LoginScreen.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 10/4/22.
//

import SwiftUI

struct LoginScreen: View {

    // MARK: - Login Properties
    @State private var user = ""
    @State private var password = ""

    var body: some View {
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
                Button(action: {}) {
                    Text("login_signIn")
                        .font(.system(size: 16))
                        .bold()
                }.buttonStyle(
                    ButtonGeneralStyle(textColor: Color("blueColor"),
                                       backgroundColor: Color("lightBlueColor"),
                                       disabled: false)
                )
            }
        }
        .padding(.top, 100)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
