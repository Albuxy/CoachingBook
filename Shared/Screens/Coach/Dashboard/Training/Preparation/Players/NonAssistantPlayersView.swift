//
//  NonAssistantPlayersView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 26/4/22.
//

import SwiftUI

struct NonAssistantPlayersView: View {

    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    var playersListData: [Player]
    var colors: [Color]

    var body: some View {
        ZStack {
            VStack(spacing: 30){
                VStack(alignment: .leading, spacing: 30){
                    Text("non_player_selection_title".localized(LocalizationService.shared.language))
                        .font(.system(size: 22))
                        .foregroundColor(.black)
                        .bold()
                        .frame(width: UIScreen.main.bounds.width / 1.20, alignment: .leading)
                    
                    Text("non_player_selection_subtitle".localized(LocalizationService.shared.language))
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(8)
                        .frame(width: UIScreen.main.bounds.width / 1.20, alignment: .leading)
                }
                .padding([.leading, .trailing], 20)
                ScrollView {
                        VStack(spacing: 30){
                            ForEach(playersListData) { item in
                                PlayerNonAssistingCard(player: item,
                                                       colors: colors)
                            }
                        }
                }
                Spacer()
                // MARK: - Button
                Button(action: {
                    presentation.wrappedValue.dismiss()
                }) {
                    Text("button_done".localized(LocalizationService.shared.language))
                        .font(.system(size: 18))
                        .bold()
                }.buttonStyle(
                    MediumButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                )
            }
        }
        .padding(.top, 40)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [colors[0], colors[1]]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing))
        .navigationBarTitle(Text("non_assistant_players_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
        
    }
}

struct Non_Assistant_players_Previews: PreviewProvider {
    static var previews: some View {
        NonAssistantPlayersView(playersListData: playersNotAssistData, colors: [Color("blueMediumColor"), Color("blueLightColor")])
    }
}
