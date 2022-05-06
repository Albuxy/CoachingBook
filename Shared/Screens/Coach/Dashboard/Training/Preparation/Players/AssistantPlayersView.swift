//
//  AssistantPlayersView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 24/4/22.
//

import SwiftUI

struct AssistantPlayersView: View {

    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    var playersList: [Player]
    var colors: [Color]

    var body: some View {
        ZStack {
            VStack(spacing: 20){
                VStack(spacing: 20){
                    Text("player_selection_title".localized(LocalizationService.shared.language))
                        .font(.system(size: 23))
                        .bold()
                    Text("player_selection_subtitle".localized(LocalizationService.shared.language))
                        .font(.system(size: 19))
                        .multilineTextAlignment(.center)
                        .lineSpacing(8)
                        .frame(width: UIScreen.main.bounds.width / 1.20, alignment: .leading)
                }
                ScrollView {
                    VStack(spacing: 30){
                        ForEach(playersList) { item in
                            RowForPlayer(imageString: item.image,
                                         fullName: item.name + "  " + item.surname,
                                         checked: item.isChecked)
                        }
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width / 1.2, height: 550, alignment: .top)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(Color("blueColor"), lineWidth: 1)
                            .background(
                                RoundedRectangle(cornerRadius: 12).fill(Color.white)
                            )
                    )
                }
                .frame(width: UIScreen.main.bounds.width / 1.2, height: 550, alignment: .center)
                Spacer()
                // MARK: - Button
                Button(action: {
                    presentation.wrappedValue.dismiss()
                }) {
                    Text("button_save_details".localized(LocalizationService.shared.language))
                        .font(.system(size: 16))
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
        .navigationBarTitle(Text("assistant_players_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
}

struct RowForPlayer: View {
    var imageString: String
    var fullName: String
    var checked: Bool

    var body: some View {
        HStack{
            HStack(spacing: 30){
                Image(imageString)
                    .resizable()
                    .frame(width: 34, height: 34)
                Text(fullName)
                    .font(.system(size: 21))
            }
            Spacer()
            CheckBoxView(isChecked: checked)
        }
    }
}

struct AssistantPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        AssistantPlayersView(playersList: playersData, colors: [Color("blueMediumColor"), Color("blueLightColor")])
    }
}
