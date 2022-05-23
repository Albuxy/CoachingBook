//
//  MenuButton.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 3/5/22.
//

import SwiftUI

struct MenuButton: View {
    
    let name: String
    let image: String
    let imageSelected: String
    var disabledSection: Bool

    @Binding var selectedMenu: String

    @StateObject var menuModelView: MenuViewModel

    var menuCurrentEntry: MenuEntries

    @State private var openView = false

    var body: some View {
      Button(
        action: {
          withAnimation(.spring()) {
            menuModelView.showSection = menuCurrentEntry
            selectedMenu = name
            menuModelView.showMenu.toggle()
          }
        },
        label: {
          HStack(spacing: 34) {
            if selectedMenu == name {
                Image(imageSelected)
                    .resizable()
                    .frame(width: 28, height: 28)
            } else {
              Image(image)
                    .resizable()
                    .frame(width: 28, height: 28)
            }
              Text(name.localized(LocalizationService.shared.language))
                 .foregroundColor(.white)
                 .font(.system(size: 18))
          }
          .padding(.horizontal)
          .padding(.leading, 30)
          .frame(width: 320, height: 70, alignment: .leading)
          .background(
              selectedMenu == name ? Color("blueDarkColor") : Color.clear
          )
          .cornerRadius(4.0)
        }
      ).disabled(disabledSection)

    }
}

struct MenuButton_Previews: PreviewProvider {
    @State static var value = "Home"
    static var previews: some View {
        MenuButton(name: "Home",
                   image: "ic_home",
                   imageSelected: "ic_home",
                   disabledSection: true,
                   selectedMenu: $value,
                   menuModelView: MenuViewModel(),
                   menuCurrentEntry: .home)
    }
}
