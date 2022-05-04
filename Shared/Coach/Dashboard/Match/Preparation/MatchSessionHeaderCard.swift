//
//  MatchSessionHeaderCard.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 27/4/22.
//

import SwiftUI

struct MatchSessionHeaderCard: View {

    var matchSession: Match

    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 12){
                Text(matchSession.title)
                    .font(.system(size: 23))
                    .foregroundColor(.black)
                    .bold()
                Text(matchSession.date)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                Text("Players: " + "\(matchSession.playersAssisting.count)")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
            }
            .frame(width: 300, height: 150, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(Color.clear, lineWidth: 1)
                    .background(
                        RoundedRectangle(cornerRadius: 20).fill(Color.white)
                    )
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
            )
        }
    }
}

struct MatchSessionHeaderCard_Previews: PreviewProvider {
    static var previews: some View {
        MatchSessionHeaderCard(matchSession: matchData[0])
    }
}
