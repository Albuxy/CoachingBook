//
//  MatchDashboardCard.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 22/4/22.
//

import SwiftUI

struct MatchDashboardCard: View {

    @State var matches: [Match] = matchData

    var body: some View {
        VStack(spacing: 15){
            VStack {
                VStack(alignment: .leading, spacing: 16){
                    Text("games_uppercased")
                        .font(.system(size: 28))
                        .bold()
                        .frame(width: 280, height: 20, alignment: .leading)
                    Text("sessions_uppercased")
                        .font(.system(size: 28))
                        .foregroundColor(Color("darkRedColor"))
                        .bold()
                        .frame(width: 170, height: 20)
                }
                Image("Match_preparation")
                    .resizable()
                    .frame(width: 180, height: 140)
                    .padding(.top, -30)
                    .padding(.leading, 100)
            }
            .padding(.top, 30)
            .frame(width: UIScreen.main.bounds.width / 1.2, height: 220, alignment: .top)
            VStack(alignment: .center, spacing: 15){
                ForEach($matches.prefix(3)) { item in
                    MiniMatchSessionCard(currentMatchSession: item)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 1.40, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color("greenMediumColor"), Color("greenLightColor")]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing))
        .cornerRadius(24)
    }
}

struct MatchDashboardCard_Previews: PreviewProvider {
    static var previews: some View {
        MatchDashboardCard()
    }
}
