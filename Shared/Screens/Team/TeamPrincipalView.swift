//
//  TeamPrincipalView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 6/5/22.
//

import SwiftUI

struct TeamPrincipalView: View {

    @ObservedObject var team: TeamListModel
    @ObservedObject var listOfPlayers: PlayersListModel
    
    @State var navigateToTeamScreen = false
    @State var navigateToPlayersScreen = false
    @State var navigateToStatsScreen = false
    @State var navigateToEventsScreen = false

    var body: some View {
        VStack(spacing: 60){
            HStack(spacing: 100){
                VStack(alignment: .leading, spacing: 20){
                    Text(team.teamsList[0].name)
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                        .bold()
                    Text(team.teamsList[0].category)
                        .foregroundColor(.black)
                        .font(.system(size: 21))
                }
                Image(team.teamsList[0].logoString)
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
                      destination: TeamInformationView(team: team),
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
                        destination: StatsTeamView(team: team),
                      isActive: $navigateToStatsScreen,
                      label: {
                          ButtonCardTeamView(title: "team_stats_title",
                                             imageString: "ic_stats_team",
                                             booleanToChange: $navigateToStatsScreen)
                      }
                    )
                    NavigationLink(
                      destination: EventsListView(team: team),
                      isActive: $navigateToEventsScreen,
                      label: {
                          ButtonCardTeamView(title: "team_events_title",
                                             imageString: "ic_events_team",
                                             booleanToChange: $navigateToEventsScreen)
                      }
                    )
                }
            }
        }
        .padding(.top, 94)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
        .background(Color("fourthLightBlueColor"))
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
        TeamPrincipalView(team: TeamListModel(), listOfPlayers: PlayersListModel())
    }
}
