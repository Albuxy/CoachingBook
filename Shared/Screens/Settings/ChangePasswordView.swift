//
//  ChangePasswordView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 4/5/22.
//

import SwiftUI

struct ChangePasswordView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    @State var currentPassword = ""
    @State var newPassword = ""
    @State var confirmPassword = ""

    var body: some View {
        ZStack{
            GeometryReader { _ in
                VStack(spacing: 40){
                    VStack(spacing: 30){
                        Text("change_password_title"
                                .localized(LocalizationService.shared.language))
                            .foregroundColor(.black)
                            .font(.system(size: 23))
                            .bold()
                            .frame(width: UIScreen.main.bounds.width / 1.30, alignment: .leading)
                        Text("change_password_subtitle"
                                .localized(LocalizationService.shared.language))
                            .foregroundColor(.black)
                            .font(.system(size: 19))
                            .multilineTextAlignment(.leading)
                            .lineSpacing(8)
                            .frame(width: UIScreen.main.bounds.width / 1.30, alignment: .leading)
                    }
                    VStack(spacing: 40){
                        SecureFieldGeneral(defaultTextFiled: "current_password",
                                           stringTextField: $currentPassword)
                        SecureFieldGeneral(defaultTextFiled: "new_password",
                                           stringTextField: $newPassword)
                        SecureFieldGeneral(defaultTextFiled: "confirm_password",
                                           stringTextField: $confirmPassword)
                    }
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }) {
                        Text("change_password_title".localized(LocalizationService.shared.language))
                            .font(.system(size: 16))
                            .bold()
                    }.buttonStyle(
                        MediumButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                    ).padding(.top, 180)
                }
                .padding(.top, 30)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
                .background(Color("lightBlueColor").opacity(0.7))
                .background(.white)
                .navigationBarTitle(Text("change_password_title".localized(LocalizationService.shared.language)), displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(
                  leading: Button(action: { presentation.wrappedValue.dismiss() }) {
                      Image("left_arrow")
                          .resizable()
                          .frame(width: 35, height: 35)
                })
            }
        }
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}
