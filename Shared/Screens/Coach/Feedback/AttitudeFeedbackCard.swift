//
//  AttitudeFeedbackCard.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 24/5/22.
//

import SwiftUI

struct AttitudeFeedbackCard: View {
    var body: some View {
        VStack(spacing: 15){
            VStack(alignment: .center){
                Text("attitude_upper_title".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 28))
                    .bold()
                Image("ic_attitude")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            .padding(.top, 30)
            .frame(width: UIScreen.main.bounds.width / 1.2, height: 200, alignment: .top)
            VStack(alignment: .center, spacing: 15){
                MiniTrainingSessionGiveCard(currentTrainingSession: trainingData[3])
                MiniMatchSessionGiveCard(currentMatchSession: matchData[3])
                MiniMatchSessionGiveCard(currentMatchSession: matchData[4])
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 1.40, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .strokeBorder(Color.black, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 24).fill(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "FFF0DA"), Color.init(hex: "DEFEE5")]),
                                                                           startPoint: .topLeading,
                                                                           endPoint: .bottomTrailing))
                )
        )
    }
}

struct AttitudeFeedbackCard_Previews: PreviewProvider {
    static var previews: some View {
        AttitudeFeedbackCard()
    }
}
