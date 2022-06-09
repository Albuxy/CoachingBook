//
//  SettingsView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 4/5/22.
//

import SwiftUI

struct SettingsView: View {
    
    @State var navigateToChangePassword = false
    @State var navigateToRemoveAccount = false
    
    @State var toggleNews = false
    @State var toggleActivity = false
    @State var toggleUpdate = false

    @AppStorage("language")
    public var language = LocalizationService.shared.language
    
    var body: some View {
        ZStack {
            VStack(spacing: 50) {
                VStack(spacing: 20) {
                    TitleWithLineSettings(imageString: "ic_account_blue",
                                          title: "settings_account_title".localized(language))
                    VStack(spacing: 35) {
                        NavigationLink(
                          destination: ChangePasswordView(),
                          isActive: $navigateToChangePassword,
                          label: {
                              ButtonWithArrow(nameButton: "change_password_title".localized(language),
                                              booleanToChange: $navigateToChangePassword)
                          }
                        )
                        NavigationLink(
                          destination: RemoveAccountView(),
                          isActive: $navigateToRemoveAccount,
                          label: {
                              ButtonWithArrow(nameButton: "remove_account_title".localized(language),
                                              booleanToChange: $navigateToRemoveAccount)
                          }
                        )
                        DropDownLanguageView(title: "settings_language_title",
                                             language: getStringForLanguage(language: language))
                    }
                }
            }
        }
        .padding(.top, 140)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height ,alignment: .top)
        .background(Color("lightBlueColor"))
    }
    
    func getStringForLanguage(language: Language) -> String{
        switch language {
        case .english_us:
            return "English"
        case .spanish:
            return "Español"
        case .catalan:
            return "Catalan"
        }
    }
}

struct TitleWithLineSettings: View {

    var imageString: String
    var title: String

    var body: some View {
        VStack(alignment: .leading){
            HStack(spacing: 20){
                Image(imageString)
                    .resizable()
                    .frame(width: 30, height: 30)
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: 19))
                    .bold()
                
            }
            Divider()
                .frame(width: UIScreen.main.bounds.width / 1.20)
                .background(Color.black)
        }
    }
}

struct ToggleWithTitle: View {

    var title: String
    @Binding var boolToChange: Bool

    var body: some View {
        HStack(){
            Text(LocalizedStringKey(title))
                .font(.system(size: 18))
                .foregroundColor(.black)
            Spacer()
            Toggle("", isOn: $boolToChange)
                .tint(Color("blueColor"))
        }
        .frame(width: 320)
    }
}

struct DropDownLanguageView: View {

    var title: String
    var language: String

    var body: some View {
        HStack{
            Text(title.localized(LocalizationService.shared.language))
                .font(.system(size: 18))
                .foregroundColor(.black)
            Spacer()
            Menu {
                Button {
                    LocalizationService.shared.language = .english_us
                } label: {
                    Text("English")
                }
                Button {
                    LocalizationService.shared.language = .spanish
                } label: {
                    Text("Español")
                }
                Button {
                    LocalizationService.shared.language = .catalan
                } label: {
                    Text("Catalan")
                }
            } label: {
                VStack(spacing: 5){
                    HStack{
                        Text(language)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.black)
                            .font(Font.system(size: 18))
                            .padding(.trailing, -10)
                    }
                    .padding(.horizontal)
                }
                .padding(8)
                .frame(width: 150)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.black.opacity(0.7), lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                        )
                )
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.3, height: 40)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
