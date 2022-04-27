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

    var playersList: [Player]
    var colors: [Color]

    var body: some View {
        ZStack {
            VStack(spacing: 40){
                VStack(alignment: .leading, spacing: 30){
                    Text("non_player_selection_title")
                        .font(.system(size: 24))
                        .bold()
                    
                    Text("non_player_selection_subtitle")
                        .font(.system(size: 18))
                        .multilineTextAlignment(.leading)
                        .lineSpacing(8)
                }
                .padding([.leading, .trailing], 20)
                ScrollView {
                    VStack(spacing: 30){
                        ForEach(playersList) { item in
                            PlayerNonAssistingCard(player: item, colors: colors)
                        }
                    }
                }
                Spacer()
                // MARK: - Button
                Button(action: {
                    presentation.wrappedValue.dismiss()
                }) {
                    Text("button_done")
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
        .navigationBarTitle(Text("non_assistant_players_title"), displayMode: .inline)
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
        NonAssistantPlayersView(playersList: playersNotAssistData, colors: [Color("blueMediumColor"), Color("blueLightColor")])
    }
}
