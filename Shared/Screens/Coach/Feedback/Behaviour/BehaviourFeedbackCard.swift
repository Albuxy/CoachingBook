//
//  BehaviourFeedbackCard.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 24/5/22.
//

import SwiftUI

struct BehaviourFeedbackCard: View {
    var body: some View {
        VStack(spacing: 15){
            VStack(alignment: .center){
                Text("behaviour_upper_title".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 28))
                    .bold()
                Image("ic_behavi")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            .padding(.top, 30)
            .frame(width: UIScreen.main.bounds.width / 1.2, height: 200, alignment: .top)
            VStack(alignment: .center, spacing: 15){
                MiniMatchSessionGiveBehaCard(currentMatchSession: matchData[1])
                MiniMatchSessionGiveBehaCard(currentMatchSession: matchData[2])
                MiniTrainingSessionGiveBehaCard(currentTrainingSession: trainingData[2])
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 1.40, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .strokeBorder(Color.black, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 24).fill(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "E5EEFF"), Color.init(hex: "F7FAD4")]),
                                                                           startPoint: .topLeading,
                                                                           endPoint: .bottomTrailing))
                )
        )
    }
}

struct BehaviourFeedbackCard_Previews: PreviewProvider {
    static var previews: some View {
        BehaviourFeedbackCard()
    }
}
