//
//  MenuView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 3/5/22.
//

import SwiftUI

struct MenuView: View {
    
    @StateObject var menuData = MenuViewModel()

    private func menuButtonEntry(name: String, image: String, imageSelected: String, isDisabled: Bool, entryMenu: MenuEntries) -> MenuButton {
      return MenuButton(name: name,
                        image: image,
                        imageSelected: imageSelected,
                        disabledSection: isDisabled,
                        selectedMenu: $menuData.selectedMenu,
                        menuModelView: menuData,
                        menuCurrentEntry: entryMenu)
    }

    var body: some View {
      NavigationView {
        VStack(alignment: .center, spacing: 30) {
            VStack(spacing: 30){
                Image("ic_coachImage")
                    .resizable()
                    .frame(width: 85, height: 85)
                    .cornerRadius(50)
                VStack(alignment: .center, spacing: 20) {
                  Text("Coach name")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 21))
                  Text("correo@gmailpuntocom")
                    .foregroundColor(Color("lightGrayColor"))
                    .font(.system(size: 18))
                }
            }
            .padding(.top, 20)

          VStack(alignment: .center, spacing: 10) {
              menuButtonEntry(
                name: "Home", image: "ic_home", imageSelected: "ic_home",
                isDisabled: false, entryMenu: .home)
              menuButtonEntry(
                name: "Profile", image: "ic_profile", imageSelected: "ic_profile", isDisabled: false,
                entryMenu: .profile)
              menuButtonEntry(
                name: "Team", image: "ic_teams", imageSelected: "ic_teams", isDisabled: false,
                entryMenu: .team)
              menuButtonEntry(
                name: "Calendar", image: "ic_calendar", imageSelected: "ic_calendar", isDisabled: false,
                entryMenu: .calendar)
              menuButtonEntry(
                name: "Settings", image: "ic_settings", imageSelected: "ic_settings",
                isDisabled: false,
                entryMenu: .settings)
              menuButtonEntry(
                name: "Logout", image: "ic_logout", imageSelected: "ic_logout", isDisabled: false,
                entryMenu: .logout)
          }
          .padding(.horizontal)
          .frame(maxWidth: .infinity, alignment: .leading)
        }
         .frame(height: UIScreen.main.bounds.height)
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .background(Color("blueColor"))
      }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
