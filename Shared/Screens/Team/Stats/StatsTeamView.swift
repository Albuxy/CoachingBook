//
//  StatsTeamView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 14/5/22.
//

import SwiftUI

struct StatsTeamView: View {

    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    @State var navigateToTotalRanking = false

    var currentTeam: Team
    @ObservedObject var team: TeamListModel

    var body: some View {
        ZStack{
            VStack(spacing: 35){
                ZStack(alignment: .top){
                    Rectangle()
                        .foregroundColor(Color("blueColor"))
                        .frame(width: UIScreen.main.bounds.width,
                               height: 220)
                    VStack(alignment: .center, spacing: 35){
                        VStack(alignment: .leading, spacing: 25){
                            HStack(spacing: 8){
                                Image("ic_bullet_white")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                Text("stats_team_title".localized(LocalizationService.shared.language))
                                    .font(.system(size: 21))
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            Text("stats_team_subtitle".localized(LocalizationService.shared.language))
                                .font(.system(size: 19))
                                .foregroundColor(.white)
                        }
                        .padding(.top, 20)
                        HStack(spacing: 22){
                            LitleGeneralStatCard(imageString: "ic_team_attendance",
                                                 titleString: "stats_perc_attendance",
                                                 percentatge: currentTeam.generalStats[0].percTotal,
                                                 primaryColor: Color("darkRedColor"))
                            LitleGeneralStatCard(imageString: "ic_team_punctuality",
                                                 titleString: "stats_perc_punctuality",
                                                 percentatge: currentTeam.generalStats[1].percTotal,
                                                 primaryColor: Color("baseColor"))
                        }
                    }
                }
                GeneralStatsTeamCard(generalStats: currentTeam.generalStats)
                TotalRankingButton(imageString: "ic_bullet_green",
                                   titleString: "total_ranking_stats",
                                   team: currentTeam)
            }
             .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
             .background(Color("fourthLightBlueColor"))
        }
        .padding(.top, 45)
        .navigationBarTitle(Text("stats_general_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
          })
    }
}

struct LitleGeneralStatCard: View {

    var imageString: String
    var titleString: String
    var percentatge: Float
    var primaryColor: Color

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(imageString)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .strokeBorder(Color.clear, lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 40).fill(primaryColor.opacity(0.3))
                        )
                )
            VStack(alignment: .center, spacing: 10) {
                Text("\(Int(percentatge * 100))" + " %")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(primaryColor)
                Text(titleString.localized(LocalizationService.shared.language))
                    .font(.system(size: 15))
                    .padding([.leading, .trailing], 10)
                    .foregroundColor(.black.opacity(0.8))
                    .multilineTextAlignment(.center)
            }
        }
        .padding(.top, 10)
        .frame(width: 160, height: 150, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.clear, lineWidth: 3)
                .background(
                    RoundedRectangle(cornerRadius: 10).fill(Color.white)
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        )
    }
}

struct TotalRankingButton: View {

    var imageString: String
    var titleString: String
    var team: Team
    
    @State var navigateToRanking = false

    var body: some View {
        NavigationLink(
          destination: TotalRankingView(currentTeam: team),
          isActive: $navigateToRanking,
          label: {
              Button {
                  navigateToRanking.toggle()
              } label: {
                  HStack(alignment: .center, spacing: 15) {
                      Image(imageString)
                          .resizable()
                          .frame(width: 20, height: 20)
                      Text(titleString.localized(LocalizationService.shared.language))
                          .font(.system(size: 18))
                          .bold()
                          .foregroundColor(.black)
                      Spacer()
                      Image("right_arrow")
                          .resizable()
                          .frame(width: 30, height: 30)
                  }
                  .padding([.leading, .trailing], 20)
                  .frame(width: 340, height: 60, alignment: .leading)
                  .background(
                      RoundedRectangle(cornerRadius: 10)
                          .strokeBorder(Color.clear, lineWidth: 3)
                          .background(
                              RoundedRectangle(cornerRadius: 10).fill(Color.white)
                          )
                          .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                  )
              }
          }
        )
        
    }
}

struct StatsTeamView_Previews: PreviewProvider {
    static var previews: some View {
        StatsTeamView(currentTeam: teamsData[0], team: TeamListModel())
    }
}
