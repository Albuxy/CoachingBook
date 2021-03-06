//
//  PlayerNonAssistingCard.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 26/4/22.
//

import SwiftUI

struct PlayerNonAssistingCard: View {

    var player: Player
    @State var navigateToReasonScreen = false
    var colors: [Color]

    var body: some View {
        NavigationLink(
          destination: ReasonForNonAttendanceView(player: player, colors: colors),
          isActive: $navigateToReasonScreen,
          label: {
              Button {
                  navigateToReasonScreen.toggle()
              } label: {
                  HStack(alignment: .center, spacing: 20){
                      Image(player.image)
                          .resizable()
                          .frame(width: 51, height: 56)
                          .padding(.leading, 15)
                      VStack(alignment: .leading, spacing: 8){
                          Text(player.name + " " + player.surname)
                              .font(.system(size: 18))
                              .foregroundColor(.black)
                          Text(player.getStringForJustificationstatus(justification: player.isJustificated ?? .notFilled))
                              .foregroundColor(player.getColorForJustificationstatus(justification: player.isJustificated ?? .notFilled))
                              .font(.system(size: 14))
                              .padding(5)
                              .padding([.leading, .trailing], 15)
                              .background(
                                  RoundedRectangle(cornerRadius: 14)
                                    .strokeBorder(player.getColorForJustificationstatus(justification: player.isJustificated ?? .notFilled), lineWidth: 2)
                                      .background(
                                          RoundedRectangle(cornerRadius: 14).fill(player.getColorForJustificationstatus(justification: player.isJustificated ?? .notFilled).opacity(0.3))
                                      )
                                      .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                              )
                      }
                      Spacer()
                      Image("ic_arrow_right")
                          .resizable()
                          .frame(width: 21, height: 21)
                          .padding(.trailing, 15)
                  }
              }
              .frame(width: 350, height: 80, alignment: .center)
              .background(
                  RoundedRectangle(cornerRadius: 10)
                      .strokeBorder(Color.black, lineWidth: 1)
                      .background(
                          RoundedRectangle(cornerRadius: 10).fill(Color.white)
                      )
                      .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
              )
          }
        )
    }
}

struct PlayerNonAssistingCard_Previews: PreviewProvider {
    static var previews: some View {
        PlayerNonAssistingCard(player: playersNotAssistData[1], colors: [Color("blueMediumColor"), Color("blueLightColor")])
    }
}
