//
//  AddPlayerView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 10/5/22.
//

import SwiftUI

struct AddPlayerView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var listOfPlayers: PlayersListModel
    
    // MARK: - Player Information Properties
    @State var name = ""
    @State var surname = ""
    @State var dateOfBirth: Date?
    @State var gender = ""
    @State var contactNumber = ""
    @State var position = ""
    @State var dorsal = ""
    
    let dropDownOptions = ["position_base".localized(LocalizationService.shared.language),
                           "position_escolta".localized(LocalizationService.shared.language),
                           "position_alero".localized(LocalizationService.shared.language),
                           "position_alapivot".localized(LocalizationService.shared.language),
                           "position_pivot".localized(LocalizationService.shared.language)]
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            VStack{
                ScrollView{
                    VStack(spacing: 20){
                        ProfileAddPlayerView(name: $name,
                             surname: $surname,
                             dateOfBirth: $dateOfBirth,
                             gender: $gender)
                        TeamAddPlayerView(contactNumber: $contactNumber,
                                          position: $position,
                                          dorsal: $dorsal)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.2, alignment: .top)
                // MARK: - Button
                Button(action: {
                    let newPlayer = Player(name: name,
                                           surname: surname,
                                           image: "ic_player",
                                           date: (dateOfBirth?.formatted())!,
                                           position: changeToPosition(position: position),
                                           dorsal: Int(dorsal) ?? 0,
                                           hasStats: false,
                                           tardance: "",
                                           totalStat: 0)
                    listOfPlayers.addItem(item: newPlayer)
                    presentation.wrappedValue.dismiss()
                }) {
                    Text("button_save_details".localized(LocalizationService.shared.language))
                        .font(.system(size: 16))
                        .bold()
                }.buttonStyle(
                    MediumButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                )
                .padding(.bottom, 30)
            }
            .padding(.top, 40)
            .background(Color("secondLightBlueColor"))
        }
        .background(Color("secondLightBlueColor").opacity(0.4))
        .background(Color.white)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text("add_player_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
          })
    }
    
    func changeToPosition(position: String) -> Position {
        if position == "position_base" {
            return .base
        } else if position == "position_alero" {
            return .alero
        } else if position == "position_escolta" {
            return .escolta
        } else if position == "position_alapivot" {
            return .alapivot
        } else {
            return .pivot
        }
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView(listOfPlayers: PlayersListModel())
    }
}


