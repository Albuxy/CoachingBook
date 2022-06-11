//
//  PersonalDetailView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 6/5/22.
//

import SwiftUI

struct PersonalDetailView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var listOfPlayers: PlayersListModel
    
    var currentPlayer: Player
    
    @State var nameVariable = ""
    @State var surnameVariable = ""
    @State var dateOfBirthVariable = ""
    
    var body: some View {
        ZStack {
            VStack(spacing: 60){
                ZStack(alignment: .top){
                    Rectangle()
                        .foregroundColor(Color("blueColor"))
                        .frame(width: UIScreen.main.bounds.width,
                               height: 180)
                    Image("ic_women")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .padding()
                        .padding([.leading, .trailing], 20)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(Color.white, lineWidth: 12)
                                .background(
                                    RoundedRectangle(cornerRadius: 15).fill(Color("orangeLightColor"))
                                )
                                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                        )
                        .padding(.top, 80)
                }
                VStack(spacing: 50){
                    SectionPlayerView(string: "contact_name_title",
                                      currentString: currentPlayer.name,
                                      saveVariable: $nameVariable)
                    SectionPlayerView(string: "coach_surname",
                                      currentString: currentPlayer.surname,
                                      saveVariable: $surnameVariable)
                    SectionPlayerView(string: "coach_dateOfBirth",
                                      currentString: currentPlayer.date,
                                      saveVariable: $dateOfBirthVariable)
                }
                // MARK: - Button save details
                Button(action: {
                    saveDetails()
                    presentation.wrappedValue.dismiss()
                }) {
                    Text("button_save_details".localized(LocalizationService.shared.language))
                        .font(.system(size: 16))
                        .bold()
                }.buttonStyle(
                    MediumButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                ).padding(.top, 80)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
            .background(Color("fourthLightBlueColor"))
            
        }
        .navigationBarTitle(Text("personal_details_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
          })
    }
    
    func saveDetails(){
        let index = listOfPlayers.playersList.firstIndex(where: {$0.dorsal == currentPlayer.dorsal})
        if nameVariable != "" {
            listOfPlayers.playersList[index!].name = nameVariable
        }
        if surnameVariable != "" {
            listOfPlayers.playersList[index!].surname = surnameVariable
        }
        if dateOfBirthVariable != "" {
            listOfPlayers.playersList[index!].date = dateOfBirthVariable
        }
    }
}

struct SectionPlayerView: View {
    
    var string: String
    var currentString: String
    @Binding var saveVariable: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text(string.localized(LocalizationService.shared.language) + ":")
                .font(.system(size: 19))
                .foregroundColor(.black)
            VStack(spacing: 5){
                TextField("", text: $saveVariable)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .placeholder(Text(currentString.isEmpty ? "write_title".localized(LocalizationService.shared.language) : currentString)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 20))
                                 ,show: saveVariable.isEmpty)
                Divider()
                    .background(.black)
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.4, alignment: .leading)
    }
}

struct PersonalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalDetailView(listOfPlayers: PlayersListModel(), currentPlayer: playersData[0])
    }
}
