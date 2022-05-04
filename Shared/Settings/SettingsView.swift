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
    
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    TitleWithLineSettings(imageString: "ic_account_blue",
                                          title: "settings_account_title")
                    VStack(spacing: 20) {
                        ButtonWithArrow(nameButton: "change_password_title",
                                        booleanToChange: $navigateToChangePassword)
                        ButtonWithArrow(nameButton: "remove_account_title",
                                        booleanToChange: $navigateToRemoveAccount)
                    }
                }
                VStack(spacing: 20) {
                    TitleWithLineSettings(imageString: "ic_notifications",
                                          title: "settings_notifications_title")
                    VStack(spacing: 20) {
                        ToggleWithTitle(title: "settings_news_title",
                                        boolToChange: $toggleNews)
                        ToggleWithTitle(title: "settings_account_acitivity_title",
                                        boolToChange: $toggleActivity)
                        ToggleWithTitle(title: "settings_update_matches_title",
                                        boolToChange: $toggleUpdate)
                        
                    }
                }
            }
        }
        .padding(.top, 120)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.2 ,alignment: .top)
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
                Text(LocalizedStringKey(title))
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
