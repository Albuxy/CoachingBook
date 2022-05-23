//
//  TeamInformationView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 8/5/22.
//

import SwiftUI

struct TeamInformationView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    var team: Team
    
    @State var removeTeam = false
    
    var body: some View {
        VStack(spacing: 20){
            ZStack(alignment: .top){
                Rectangle()
                    .foregroundColor(Color("thirdLightBlueColor"))
                    .frame(width: UIScreen.main.bounds.width,
                           height: 240)
                TeamPrincipalInfoCard(team: team)
                    .padding(.top, 55)
            }
            VStack(spacing: 20){
                Text("training_sessions_title".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 19))
                HStack{
                    VStack(alignment: .leading, spacing: 20){
                        Text("days_title".localized(LocalizationService.shared.language))
                            .foregroundColor(.black)
                            .font(.system(size: 19))
                            .underline()
                        ForEach(team.trainingDays){ item in
                            HStack(spacing: 15){
                                Text("•")
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                Text(item.getStringsForDay(currentDay: item.day))
                                    .foregroundColor(.black)
                                    .font(.system(size: 18))
                            }
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 25){
                        Text("hour_title".localized(LocalizationService.shared.language))
                            .foregroundColor(.black)
                            .font(.system(size: 19))
                            .underline()
                        ForEach(team.trainingDays){ item in
                            Text(item.hour)
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding([.leading, .trailing], 30)
                .frame(width: 320, height: 120, alignment: .topLeading)
                
                Text("local_matches_title".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 19))
                HStack{
                    VStack(alignment: .leading, spacing: 20){
                        Text("days_title".localized(LocalizationService.shared.language))
                            .foregroundColor(.black)
                            .font(.system(size: 19))
                            .underline()
                        HStack(spacing: 15){
                            Text("•")
                                .foregroundColor(.black)
                                .font(.system(size: 18))
                            Text(team.matchDay.getStringsForDay(currentDay: team.matchDay.day))
                                .foregroundColor(.black)
                                .font(.system(size: 18))
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 25){
                        Text("hour_title".localized(LocalizationService.shared.language))
                            .foregroundColor(.black)
                            .font(.system(size: 19))
                            .underline()
                        Text(team.matchDay.hour)
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                    }
                }
                .padding([.leading, .trailing], 30)
                .frame(width: 320, height: 350, alignment: .topLeading)
            }
            .padding(.top, 20)
            .frame(width: 320, height: 340, alignment: .top)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(Color.clear, lineWidth: 3)
                    .background(
                        RoundedRectangle(cornerRadius: 15).fill(Color.white)
                    )
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
            )
            RemoveButton(stringButton: "button_remove_team", booleanToChange: $removeTeam)
                .padding(.top, 20)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
        .background(Color("fourthLightBlueColor"))
        .navigationBarTitle(Text("team_information_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
          })
    }
}

struct TeamPrincipalInfoCard: View {

    var team: Team

    var body: some View {
        VStack(spacing: 15){
            Image(team.logoString)
                .resizable()
                .frame(width: 100, height: 100)
            VStack(spacing: 8){
                Text(team.name)
                    .font(.system(size: 21))
                    .foregroundColor(.black)
                    .bold()
                Text(team.category)
                    .font(.system(size: 21))
                    .foregroundColor(.black)
            }
            HStack(spacing: 12){
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
                Text("\(team.players.count)" + " players")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
            }
        }
        .padding(.top, 20)
        .frame(width: 320, height: 250, alignment: .top)
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

struct TeamInformationView_Previews: PreviewProvider {
    static var previews: some View {
        TeamInformationView(team: teamsData[0])
    }
}
