//
//  MatchPreparationView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 27/4/22.
//

import SwiftUI
import CoreData

struct MatchPreparationView: View {

    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var managedObjectContext

    @Binding var currentMatch: Match
    
    @State var numberOfPeriods = 0
    @State var importanceLevel = ""

    @State var navigateToCancelSession = false
    @State var navigateToAssistantePlayers = false
    @State var navigateToNonAssistantePlayers = false
    @State var navigateToPrepareEntries = false

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
                            TitleWithLineView(title: "training_information_title")
                            TeamHeaderView(currentMatch: currentMatch)
                            OptionsPeriodsView(numberOfPeriods: currentMatch.numberOfPeriods != 0 ? currentMatch.numberOfPeriods : numberOfPeriods)
                            DropDownViewLeft(title: "importance_level_title", placeHolder: !currentMatch.importanceLevel.isEmpty ? currentMatch.importanceLevel : "None" , value: $importanceLevel)
                                .padding(.top, 8)
                        }
                        VStack(spacing: 20){
                            TitleWithLineView(title: "training_players_information")
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
                            NavigationLink(
                              destination: EntriesMatchView(match: currentMatch),
                              isActive: $navigateToPrepareEntries,
                              label: {
                                  ButtonWithArrow(nameButton: "prepare_entries_title", booleanToChange: $navigateToPrepareEntries)
                              }
                            )
                        }
                        VStack(spacing: 20){
                            TitleWithLineView(title: "actions_title")
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
                .frame(height: 535)
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
        }, trailing:
            Button(action: {
                saveDetailsMatch()
                presentation.wrappedValue.dismiss()
            }) {
            Text("Save")
              .foregroundColor(.black)
              .bold()
            })
    }

    func saveDetailsMatch() {
        currentMatch.numberOfPeriods = numberOfPeriods
        currentMatch.importanceLevel = importanceLevel
    }
}

struct TeamHeaderView: View {
    
    var currentMatch: Match
    
    var body: some View {
        HStack(spacing: 20){
            Image(currentMatch.imageTeam1)
                .resizable()
                .frame(width: 50, height: 50)
            Text("VS")
                .font(.system(size: 24))
            Image(currentMatch.imageTeam2)
                .resizable()
                .frame(width: 50, height: 50)
        }
    }
}

struct OptionsPeriodsView: View {
    
    var optionsPeriods: [Int] = [4, 6, 8]
    @State var numberOfPeriods = 0
    
    var body: some View {
        VStack(spacing: 15){
            Text("select_number_periods")
               .frame(width: UIScreen.main.bounds.width / 1.3, alignment: .leading)
            HStack(spacing: 40){
                ForEach(optionsPeriods, id: \.self) { item in
                    OptionsView(title: item,
                                placeholder: "\(numberOfPeriods)",
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

    var title: Int
    var placeholder: String
    var booleanToChange: Bool
    let callback: (Int)->()

    var body: some View {
        Button {
            self.callback(title)
        } label: {
            Text(title == 0 ? placeholder : "\(title)")
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 5)
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
    @State static var value = matchData[0]
    static var previews: some View {
        MatchPreparationView(currentMatch: $value)
    }
}
