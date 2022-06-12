//
//  MenuEntries.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 3/5/22.
//

import Foundation
import SwiftUI

enum MenuEntries {
  case home, profile, team, calendar, files, settings, logout
}

class MenuViewModel: ObservableObject {
  @Published var selectedMenu = "menu_home"
  @Published var showMenu = false
  @Published var showSection: MenuEntries = .home
}

struct MenuSwitchView: View {

  //MARK: - Presentation Propertiers
  @Environment(\.presentationMode) var presentation

  @StateObject var menuModel = MenuViewModel()
    
  @State var coach = coachData

  @Binding var userMenuEntry: MenuEntries
    
  @ObservedObject var listOfPlayers = PlayersListModel()
  @ObservedObject var coachModel = CoachListModel()
  @ObservedObject var teamModel = TeamListModel()
  @ObservedObject var fileModel = FilesModel()
  @ObservedObject var documentsList = DocumentModelList()
  @ObservedObject var imagesList = ImageModelList()
  @ObservedObject var videoslist = VideoModelList()

  var body: some View {
    VStack {
      switch self.userMenuEntry {
      case .home:
        HomeView()
          .navigationBarItems(
            leading:
              NavigationBarWithMenuIcon(menuModel: menuModel, titleBar: "menu_home"))
      case .profile:
          ProfileCoachView(coachModel: coachModel)
          .navigationBarItems(
            leading:
              NavigationBarWithMenuIcon(menuModel: menuModel, titleBar: "menu_profile"))
      case .team:
          TeamPrincipalView(team: teamModel, listOfPlayers: listOfPlayers)
              .navigationBarItems(
                leading:
                  NavigationBarWithMenuIcon(menuModel: menuModel, titleBar: "menu_team"))
      case .calendar:
        CalendarView()
              .navigationBarItems(
                leading:
                  NavigationBarWithMenuIcon(menuModel: menuModel, titleBar: "menu_calendar"))
      case .files:
        FilesView(fileModel: fileModel,
                  documentsList: documentsList,
                  imagesList: imagesList,
                  videoslist: videoslist)
              .navigationBarItems(
                leading:
                  NavigationBarWithMenuIcon(menuModel: menuModel, titleBar: "menu_files"))
      case .settings:
        SettingsView()
              .navigationBarItems(
                leading:
                  NavigationBarWithMenuIcon(menuModel: menuModel, titleBar: "menu_settings"))
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
      Text(titleBar.localized(LocalizationService.shared.language))
        .fontWeight(.semibold)
        .foregroundColor(.black)
    }
  }
}
