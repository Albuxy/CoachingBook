//
//  MatchPreparationView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 27/4/22.
//

import SwiftUI

struct MatchPreparationView: View {

    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    var currentMatch: Match
    
    @State var numberOfPeriods = ""
    @State var importanceLevel = ""

    @State var navigateToCancelSession = false
    @State var navigateToAssistantePlayers = false
    @State var navigateToNonAssistantePlayers = false

    @State var removeMatch = false

    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .center, spacing: 25) {
                ZStack(alignment: .top) {
                    Rectangle()
                        .foregroundColor(Color("greenColorLight").opacity(0.7))
                        .frame(width: UIScreen.main.bounds.width,
                               height: 140)
                    MatchSessionHeaderCard(matchSession: currentMatch)
                        .padding(.top, 30)
                }
                ScrollView {
                    VStack(spacing: 30) {
                        VStack(spacing: 10){
                            TrainingTitleWithLineView(title: "training_information_title")
                            TeamHeaderView(currentMatch: currentMatch)
                            OptionsPeriodsView(numberOfPeriods: numberOfPeriods)
                            DropDownViewLeft(title: "importance_level_title", value: $importanceLevel)
                                .padding(.top, 8)
                        }
                        VStack(spacing: 20){
                            TrainingTitleWithLineView(title: "training_players_information")
                            NavigationLink(
                              destination: AssistantPlayersView(playersList: currentMatch.playersAssisting,
                                                                colors: [Color("greenMediumColor"), Color("greenLightColor")]),
                              isActive: $navigateToAssistantePlayers,
                              label: {
                                  ButtonWithArrow(nameButton: "assistant_players_title", booleanToChange: $navigateToAssistantePlayers)
                              }
                            )
                            NavigationLink(
                              destination: NonAssistantPlayersView(playersList: playersNotAssistData,
                                                                   colors: [Color("greenMediumColor"), Color("greenLightColor")]),
                              isActive: $navigateToNonAssistantePlayers,
                              label: {
                                  ButtonWithArrow(nameButton: "non_assistant_players_title", booleanToChange: $navigateToNonAssistantePlayers)
                              }
                            )
                        }
                        VStack(spacing: 20){
                            TrainingTitleWithLineView(title: "actions_title")
                            NavigationLink(
                            destination: CancelMatchView(),
                              isActive: $navigateToCancelSession,
                              label: {
                                  ButtonWithArrow(nameButton: "cancel_session_title", booleanToChange: $navigateToCancelSession)
                              }
                            )
                        }
                    }
                }
                .frame(height: 525)
                RemoveButton(stringButton: "button_remove_match", booleanToChange: $removeMatch)
                    .padding(.top, -10)
            }
        }
        .padding(.top, 60)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
        .navigationBarTitle(Text("match_preparation"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
}

struct TeamHeaderView: View {
    
    var currentMatch: Match
    
    var body: some View {
        HStack(spacing: 20){
            Image(currentMatch.imageTeam1)
                .resizable()
                .frame(width: 70, height: 70)
            Text("VS")
                .font(.system(size: 24))
            Image(currentMatch.imageTeam2)
                .resizable()
                .frame(width: 70, height: 70)
        }
    }
}

struct OptionsPeriodsView: View {
    
    var optionsPeriods: [String] = ["4", "6", "8"]
    @State var numberOfPeriods = ""
    
    var body: some View {
        VStack(spacing: 15){
            Text("select_number_periods")
               .frame(width: UIScreen.main.bounds.width / 1.3, alignment: .leading)
            HStack(spacing: 40){
                ForEach(optionsPeriods, id: \.self) { item in
                    OptionsView(title: item,
                                booleanToChange: $numberOfPeriods.wrappedValue == item ? true : false,
                                callback: { selected in
                                    self.numberOfPeriods = selected
                                })
                }
            }
        }
    }
}

struct OptionsView: View {

    var title: String
    var booleanToChange: Bool
    let callback: (String)->()

    var body: some View {
        Button {
            self.callback(title)
        } label: {
            Text(title)
                .padding([.leading, .trailing], 15)
                .padding([.top, .bottom], 10)
                .foregroundColor(self.booleanToChange ? Color.white : Color.black)
        }
       .background(
           RoundedRectangle(cornerRadius: 6)
               .strokeBorder(Color.black, lineWidth: 1)
               .background(
                   RoundedRectangle(cornerRadius: 6)
                       .fill(self.booleanToChange ? Color("blueColor") : Color.white)
               )
       )
    }
}

struct MatchPreparationView_Previews: PreviewProvider {
    static var previews: some View {
        MatchPreparationView(currentMatch: matchData[0])
    }
}
