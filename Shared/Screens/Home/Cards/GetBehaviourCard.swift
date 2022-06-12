//
//  GetBehaviourCard.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 24/5/22.
//

import SwiftUI

struct GetBehaviourCard: View {

    var currentTeam: Team
    @State var navigateToSeeStats = false
    @ObservedObject var team: TeamListModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            HStack(spacing: 30) {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 3.0)
                        .foregroundColor(Color.init(hex: "A9AB91"))
                   Image("ic_behaviour")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
                .frame(width: 60, height: 60)
                VStack(alignment: .leading, spacing: 10){
                    Text("home_get_info".localized(LocalizationService.shared.language))
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                    Text("home_information_behaviour".localized(LocalizationService.shared.language))
                        .font(.system(size: 18))
                        .bold()
                        .foregroundColor(.white)
                }
                .frame(width: 180, height: 100, alignment: .leading)
            }
            .frame(width: 200, height: 100,alignment: .leading)
            NavigationLink(
                destination: StatsTeamView(currentTeam: currentTeam, team: team),
              isActive: $navigateToSeeStats,
              label: {
                  ButtonWithNavigation(boolean: $navigateToSeeStats,
                                       title: "home_see_stats",
                                       color: Color.init(hex: "3E4025"))
              }
            )
        }
        .padding(.leading, 30)
        .frame(width: 303, height: 150, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(Color.clear, lineWidth: 1)
                .background(
                    Image("greenDarkBackground")
                        .resizable()
                        .frame(width: 303, height: 160)
                        .cornerRadius(15)
                )
        )
        
    }
}

struct GetBehaviourCard_Previews: PreviewProvider {
    static var previews: some View {
        GetBehaviourCard(currentTeam: teamsData[0], team: TeamListModel())
    }
}
