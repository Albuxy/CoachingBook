//
//  TeamPrincipalView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 6/5/22.
//

import SwiftUI

struct TeamPrincipalView: View {

    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    var currentTeam: Team
    @ObservedObject var teamList: TeamListModel
    @ObservedObject var listOfPlayers: PlayersListModel
    @ObservedObject var eventsModel: EventsListModel
    @ObservedObject var matchModel: MatchListModel
    @ObservedObject var trainingModel: TrainingListModel
    
    @State var navigateToTeamScreen = false
    @State var navigateToPlayersScreen = false
    @State var navigateToStatsScreen = false
    @State var navigateToEventsScreen = false
    @State var showAlert = false

    var body: some View {
        VStack(spacing: 60){
            HStack(spacing: 100){
                VStack(alignment: .leading, spacing: 20){
                    Text(currentTeam.name)
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                        .bold()
                    Text(currentTeam.category)
                        .foregroundColor(.black)
                        .font(.system(size: 21))
                }
                Image(currentTeam.logoString)
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            .padding(.leading, 50)
            .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .leading)
            .background(Color("thirdLightBlueColor"))
            .border(Color("secondBlueColor"))
            VStack(spacing: 40){
                HStack(spacing: 40) {
                    NavigationLink(
                        destination: TeamInformationView(currentTeam: currentTeam, team: teamList),
                      isActive: $navigateToTeamScreen,
                      label: {
                          ButtonCardTeamView(title: "team_title",
                                             imageString: "ic_info_team",
                                             booleanToChange: $navigateToTeamScreen)
                      }
                    )
                    NavigationLink(
                        destination: ListPlayersView(listOfPlayers: listOfPlayers),
                      isActive: $navigateToPlayersScreen,
                      label: {
                          ButtonCardTeamView(title: "team_players_title",
                                             imageString: "ic_players_team",
                                             booleanToChange: $navigateToPlayersScreen)
                      }
                    )
                }
                HStack(spacing: 40){
                    NavigationLink(
                      destination: StatsTeamView(currentTeam: currentTeam, team: teamList),
                      isActive: $navigateToStatsScreen,
                      label: {
                          ButtonCardTeamView(title: "team_stats_title",
                                             imageString: "ic_stats_team",
                                             booleanToChange: $navigateToStatsScreen)
                      }
                    )
                    NavigationLink(
                        destination: EventsListView(currentTeam: currentTeam,
                                                    eventsModel: eventsModel,
                                                    team: teamList,
                                                    matchModel: matchModel,
                                                   trainingModel: trainingModel),
                      isActive: $navigateToEventsScreen,
                      label: {
                          ButtonCardTeamView(title: "team_events_title",
                                             imageString: "ic_events_team",
                                             booleanToChange: $navigateToEventsScreen)
                      }
                    )
                }
            }
            .alert(
              isPresented: $showAlert,
              content: {
                Alert(
                    title: Text("remove_team".localized(LocalizationService.shared.language)),
                  message: Text("confirmation_remove_team".localized(LocalizationService.shared.language)),
                  primaryButton: .cancel(
                    Text("button_cancel".localized(LocalizationService.shared.language)),
                    action: {}),
                  secondaryButton: .destructive(
                    Text("button_remove".localized(LocalizationService.shared.language)),
                    action: {
                        let index = teamList.teamsList.firstIndex(where: {$0.name == currentTeam.name})
                        teamList.teamsList.remove(at: index!)
                        presentation.wrappedValue.dismiss()
                    })
                )
              })
        }
        .padding(.top, 64)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
        .background(Color("fourthLightBlueColor"))
        .navigationBarTitle(Text(currentTeam.name), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
          }, trailing:
            Button(action: {
                showAlert.toggle()
            }) {
              Image(systemName: "trash")
                  .resizable()
                  .frame(width: 20, height: 20)
                .foregroundColor(.black)
                
            })
    }
}

struct ButtonCardTeamView: View {

    var title: String
    var imageString: String
    @Binding var booleanToChange: Bool

    var body: some View {
        Button {
            booleanToChange.toggle()
        } label: {
            VStack(spacing: 3){
                Text(title.localized(LocalizationService.shared.language))
                    .foregroundColor(Color.black.opacity(0.8))
                    .font(.system(size: 19))
                    .bold()
                    .padding(10)
                Image(imageString)
                    .resizable()
                    .frame(width: 45, height: 45)
            }
            .padding(.top, 10)
        }
        .frame(width: 140, height: 140, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color("secondBlueColor"), lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 10).fill(Color("secondLightBlueColor"))
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        )
    }
}

struct TeamPrincipalView_Previews: PreviewProvider {
    static var previews: some View {
        TeamPrincipalView(currentTeam: teamsData[0],
                          teamList: TeamListModel(),
                          listOfPlayers: PlayersListModel(),
                          eventsModel: EventsListModel(),
                          matchModel: MatchListModel(),
                          trainingModel: TrainingListModel())
    }
}
