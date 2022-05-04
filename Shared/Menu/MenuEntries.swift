//
//  MenuEntries.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 3/5/22.
//

import Foundation
import SwiftUI

enum MenuEntries {
  case home, profile, team, calendar, settings, logout
}

class MenuViewModel: ObservableObject {
  @Published var selectedMenu = "Profile"
  @Published var showMenu = false
  @Published var showSection: MenuEntries = .profile
}

struct MenuSwitchView: View {

  //MARK: - Presentation Propertiers
  @Environment(\.presentationMode) var presentation

  @StateObject var menuModel = MenuViewModel()

  @Binding var userMenuEntry: MenuEntries

  var body: some View {
    VStack {
      switch self.userMenuEntry {
      case .home:
        EmptyView()
          .navigationBarItems(
            leading:
              NavigationBarWithMenuIcon(menuModel: menuModel, titleBar: "Home"))
      case .profile:
        ProfileCoachView()
          .navigationBarItems(
            leading:
              NavigationBarWithMenuIcon(menuModel: menuModel, titleBar: "Profile"))
      case .team:
        EmptyView()
              .navigationBarItems(
                leading:
                  NavigationBarWithMenuIcon(menuModel: menuModel, titleBar: "Team"))
      case .calendar:
        EmptyView()
              .navigationBarItems(
                leading:
                  NavigationBarWithMenuIcon(menuModel: menuModel, titleBar: "Calendar"))
      case .settings:
        EmptyView()
              .navigationBarItems(
                leading:
                  NavigationBarWithMenuIcon(menuModel: menuModel, titleBar: "Settings"))
      case .logout:
        LoginView()
      }
    }
    .navigationBarTitle(Text(""), displayMode: .inline)
    .navigationBarBackButtonHidden(true)
  }
}

struct NavigationBarWithMenuIcon: View {
  
  @StateObject var menuModel = MenuViewModel()
  let titleBar: String
  
  var body: some View {
    HStack {
      Button(action: { menuModel.showMenu.toggle() }) {
        Image("menu_icon")
          .resizable()
          .frame(width: 21, height: 21)
      }
      Spacer()
      Text(titleBar)
        .fontWeight(.semibold)
        .foregroundColor(.black)
    }
  }
}
