//
//  ListTeamView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 12/6/22.
//

import SwiftUI

struct ListTeamView: View {

    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var team: TeamListModel
    @ObservedObject var playersList: PlayersListModel
    @ObservedObject var eventsModel: EventsListModel
    @ObservedObject var matchModel: MatchListModel
    @ObservedObject var trainingModel: TrainingListModel
    @State var selectedTeam = teamsData[0]
    
    @State var navigateToTeam = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 30){
                Text("Select team to start working")
                    .font(.system(size: 34))
                    .bold()
                    .foregroundStyle(.black)
                    .padding(.leading, 45)
                ScrollView{
                    VStack(spacing: 30){
                        ForEach(team.teamsList){ currentTeam in
                            TeamCardSelect(selectedTeam: $selectedTeam, teamList: team, currentTeam: currentTeam)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: 450)
                NavigationLink(
                    destination: TeamPrincipalView(currentTeam: selectedTeam,
                                                   teamList: team,
                                                   listOfPlayers: playersList,
                                                   eventsModel: eventsModel,
                                                   matchModel: matchModel,
                                                   trainingModel: trainingModel),
                  isActive: $navigateToTeam,
                  label: {
                      Button(action: {
                          navigateToTeam.toggle()
                      }) {
                          Text("button_select".localized(LocalizationService.shared.language))
                              .font(.system(size: 21))
                              .bold()
                      }.buttonStyle(
                          MediumButtonStyle(textColor: Color.white, backgroundColor: Color("baseColor"))
                      ).padding(.leading, 45)
                  }
                )

            }
            .padding(.top, 140)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
            .background(Color("fourthLightBlueColor"))
        }
    }
}

struct TeamCardSelect: View {
    
    @Binding var selectedTeam: Team
    @ObservedObject var teamList: TeamListModel
    var currentTeam: Team
    
    var body: some View {
        Button {
            selectedTeam = currentTeam
        } label: {
            HStack{
                HStack{
                    Image(currentTeam.logoString)
                        .resizable()
                        .frame(width: 110, height: 110)
                    Spacer()
                    VStack(alignment: .leading, spacing: 10){
                        Text(currentTeam.name)
                            .foregroundColor(.black)
                            .bold()
                            .font(.system(size: 24))
                        Text(currentTeam.category)
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                            .multilineTextAlignment(.center)
                        Text("\(currentTeam.players.count)" + " players")
                            .foregroundColor(.black)
                            .font(.system(size: 14))
                    }
                    .frame(width: 130, height: 120, alignment: .leading)
                }
            }
            .padding([.leading, .trailing], 20)
            .frame(width: 330, height: 150, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(selectedTeam == currentTeam ? Color("baseColor") : Color.clear, lineWidth: 5)
                    .background(
                        RoundedRectangle(cornerRadius: 20).fill(Color("secondDarkBlueColor"))
                    )
            )
        }
    }
}

struct ListTeamView_Previews: PreviewProvider {
    static var previews: some View {
        ListTeamView(team: TeamListModel(),
                     playersList: PlayersListModel(),
                     eventsModel: EventsListModel(),
                     matchModel: MatchListModel(),
                     trainingModel: TrainingListModel())
    }
}
