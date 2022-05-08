//
//  PlayerTeamDetailView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 8/5/22.
//

import SwiftUI

struct PlayerTeamDetailView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    var currentPlayer: Player
    
    @State var contactNumber = ""
    @State var positionVariable = ""
    @State var dorsalVariable = ""

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
                    SectionPlayerView(string: "coach_mobile_number",
                                      currentString: currentPlayer.contactNumber ?? "Write",
                                      saveVariable: $contactNumber)
                        .keyboardType(.namePhonePad)
                    DropDownOptionsListView(title: "position_title",
                                         placeholder: currentPlayer.getStringForPosition(currentPosition: currentPlayer.position).isEmpty
                                         ? "contact_team_title"
                                         : currentPlayer.getStringForPosition(currentPosition: currentPlayer.position),
                                         dropDownList: currentPlayer.getAllPositionsList(),
                                         value: $positionVariable)
                    SectionPlayerView(string: "dorsal_player_title",
                                      currentString: "\(currentPlayer.dorsal)",
                                      saveVariable: $dorsalVariable)
                        .keyboardType(.numberPad)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
            .background(Color("fourthLightBlueColor"))
            
        }
        .navigationBarTitle(Text("team_details_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
          })
    }
}

struct DropDownOptionsListView: View {

    var title: String
    var placeholder: String
    var dropDownList: [String]
    @Binding var value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text(title.localized(LocalizationService.shared.language))
                .font(.system(size: 19))
                .foregroundColor(.black)
            Menu {
                ForEach(dropDownList, id: \.self){ option in
                    Button(option.localized(LocalizationService.shared.language)) {
                        self.value = option
                    }
                }
            } label: {
                VStack(spacing: 5){
                    HStack{
                        Text(value.isEmpty ? placeholder.localized(LocalizationService.shared.language) : value.localized(LocalizationService.shared.language))
                            .foregroundColor(value.isEmpty ? .gray : .black)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.black)
                            .font(Font.system(size: 18))
                    }
                    .padding(.horizontal)
                }
                .frame(width: 285, height: 45, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color.gray, lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white)
                        )
                )
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.38, alignment: .leading)
    }
}

struct PlayerTeamDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerTeamDetailView(currentPlayer: playersData[0])
    }
}
