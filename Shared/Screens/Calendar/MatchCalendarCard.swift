//
//  MatchCalendarCard.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 31/5/22.
//

import SwiftUI

struct MatchCalendarCard: View {
    
    var match: Match
    
    @State var navigateToInformation = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            HeaderMatchCalendarCard(match: match)
            .padding([.leading, .trailing], 20)
            .padding(.top)
            Divider()
                .background(Color.black)
            HStack(alignment: .top, spacing: 15) {
                Image(match.imageTeam1)
                    .resizable()
                    .frame(width: 80, height: 60)
                Text("VS")
                    .foregroundColor(.black)
                    .font(.system(size: 21))
                    .padding(.top, 15)
                Image(match.imageTeam2)
                    .resizable()
                    .frame(width: 80, height: 60)
            }
            Divider()
                .background(Color.black)
            NavigationLink(
              destination: MatchInformationView(currentMatch: match),
              isActive: $navigateToInformation,
              label: {
                  Button(action: {
                      navigateToInformation.toggle()
                  }) {
                      Text("button_view_details".localized(LocalizationService.shared.language))
                          .font(.system(size: 13))
                          .bold()
                  }
                  .buttonStyle(
                      MediumSmallButtonStyle(textColor: Color("blueColor"), backgroundColor: Color("secondBlueColor").opacity(0.3))
                  )
              }
            )
        }
        .frame(width: 320, height: 180, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(Color.clear, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 12).fill(Color.white)
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        )
    }
}

struct HeaderMatchCalendarCard: View {
    
    var match: Match
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Text(match.stringTeam1)
                .font(.system(size: 18))
                .bold()
                .foregroundColor(.black)
            + Text("  vs  ")
                .font(.system(size: 16))
                .foregroundColor(.black)
            + Text(match.stringTeam2)
                .font(.system(size: 18))
                .bold()
                .foregroundColor(.black)
                
            Spacer()
            Text(match.getStringOfStatus(currentStatus: match.statusPreparation))
                .padding([.leading, .trailing], 10)
                .padding([.top, .bottom], 3)
                .foregroundColor(match.getColorOfStatus(currentStatus: match.statusPreparation))
                .font(.system(size: 14))
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(Color.clear, lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 20).fill(match.getColorOfStatus(currentStatus: match.statusPreparation).opacity(0.2))
                        )
                )
                    
        }
    }
}


struct MatchCalendarCard_Previews: PreviewProvider {
    static var previews: some View {
        MatchCalendarCard(match: matchData[0])
    }
}
