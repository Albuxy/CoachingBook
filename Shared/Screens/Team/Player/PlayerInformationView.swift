//
//  PlayerInformationView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 6/5/22.
//

import SwiftUI

struct PlayerInformationView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    @State var navigateToPersonalDetail = false
    @State var navigateToTeamDetail = false
    @State var navigateToIndividualStats = false

    var player: Player

    var body: some View {
        ZStack{
            VStack(spacing: 40){
                ZStack(alignment: .top){
                    Rectangle()
                        .foregroundColor(Color("blueColor"))
                        .frame(width: UIScreen.main.bounds.width,
                               height: 180)
                    PlayerInfoCard(player: player)
                        .padding(.top, 65)
                }
                VStack(alignment: .center, spacing: 35) {
                    NavigationLink(
                      destination: PersonalDetailView(currentPlayer: player),
                      isActive: $navigateToPersonalDetail,
                      label: {
                          ButtonPlayerInformation(string: "personal_details_title",
                                                  booleanToChange: $navigateToPersonalDetail)
                      }
                    )
                    NavigationLink(
                      destination: PlayerTeamDetailView(currentPlayer: player),
                      isActive: $navigateToTeamDetail,
                      label: {
                          ButtonPlayerInformation(string: "team_details_title",
                                                  booleanToChange: $navigateToTeamDetail)
                      }
                    )
                    ButtonPlayerInformation(string: "individual_stats_title",
                                            booleanToChange: $navigateToIndividualStats)
                }
            }
             .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
             .background(Color("fourthLightBlueColor"))
        }
        .navigationBarTitle(Text("player_information_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
          })
    }
}

struct PlayerInfoCard: View {

    var player: Player

    var body: some View {
        VStack(spacing: 25){
            Text("\(player.dorsal)")
                .font(.system(size: 30))
                .bold()
                .foregroundColor(Color("blueColor"))
                .padding([.top, .bottom], 10)
                .padding([.leading, .trailing], 20)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .strokeBorder(Color.black, lineWidth: 1.5)
                        .background(
                            RoundedRectangle(cornerRadius: 40).fill(Color.white)
                        )
                )
                .padding(.top, 20)
            VStack(spacing: 10){
                Text(player.name + " " + player.surname)
                    .foregroundColor(.black)
                    .font(.system(size: 21))
                    .bold()
                Text(player.getStringForPosition(currentPosition: player.position))
                    .foregroundColor(.black)
                    .font(.system(size: 18))
            }
        }
        .frame(width: 340, height: 190, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .strokeBorder(Color.clear, lineWidth: 3)
                .background(
                    RoundedRectangle(cornerRadius: 15).fill(Color.white)
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        )
    }
}

struct ButtonPlayerInformation: View {

    var string: String
    @Binding var booleanToChange: Bool

    var body: some View {
        Button {
            booleanToChange.toggle()
        } label: {
            HStack{
                Text(string.localized(LocalizationService.shared.language))
                    .font(.system(size: 19))
                    .bold()
                    .foregroundColor(Color("blueColor"))
                Spacer()
                Image("ic_arrow_blue")
                    .resizable()
                    .frame(width: 35, height: 35)
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 15)
        }
        .frame(width: 350, height: 60, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .strokeBorder(Color.clear, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 15).fill(Color("secondDarkBlueColor"))
                )
        )

    }
}

struct PlayerInformationView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerInformationView(player: playersData[0])
    }
}
