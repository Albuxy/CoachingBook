//
//  MenuControllerView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 3/5/22.
//

import SwiftUI

struct MenuControllerView: View {
    
    @StateObject var menuModel = MenuViewModel()
    @ObservedObject var listOfPlayers: PlayersListModel
    @ObservedObject var coachModel: CoachListModel
    @ObservedObject var teamModel: TeamListModel
    @ObservedObject var eventsModel: EventsListModel
    @ObservedObject var fileModel: FilesModel
    @ObservedObject var documentsList: DocumentModelList
    @ObservedObject var imagesList: ImageModelList
    @ObservedObject var videoslist: VideoModelList

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
          GeometryReader { _ in
              MenuSwitchView(menuModel: menuModel, userMenuEntry: $menuModel.showSection, listOfPlayers: listOfPlayers, coachModel: coachModel, teamModel: teamModel, eventsModel: eventsModel, fileModel: fileModel, documentsList:documentsList, imagesList: imagesList, videoslist: videoslist)
          }
          .opacity(self.menuModel.showMenu ? 0.1 : 1.0)
          .onTapGesture {
            self.menuModel.showMenu = false
          }
          HStack {
            MenuView(menuData: menuModel)
              .frame(width: UIScreen.main.bounds.width / 1.2)
              .offset(x: self.menuModel.showMenu ? 0 : -UIScreen.main.bounds.width)
              .animation(.easeInOut)
          }
        }
        .navigationBarHidden(menuModel.showMenu ? true : false)
        .background(menuModel.showMenu ? Color("lightGrayColor") : Color.white)
        .edgesIgnoringSafeArea( /*@START_MENU_TOKEN@*/.all /*@END_MENU_TOKEN@*/)
    }
}

struct MenuControllerView_Previews: PreviewProvider {
    static var previews: some View {
        MenuControllerView(listOfPlayers: PlayersListModel(),
                           coachModel: CoachListModel(),
                           teamModel: TeamListModel(),
                           eventsModel: EventsListModel(),
                           fileModel: FilesModel(),
                           documentsList: DocumentModelList(),
                           imagesList: ImageModelList(),
                           videoslist: VideoModelList())
    }
}
