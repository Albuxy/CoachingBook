//
//  TrainingSessionHeaderCard.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 22/4/22.
//

import SwiftUI

struct TrainingSessionHeaderCard: View {

    var trainingSession: Training

    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 12){
                Text(trainingSession.title)
                    .font(.system(size: 23))
                    .foregroundColor(.black)
                    .bold()
                Text(trainingSession.date)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                Text("Players: " + "\(trainingSession.playersAssisting.count)")
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

struct TrainingSessionHeaderCard_Previews: PreviewProvider {
    static var previews: some View {
        TrainingSessionHeaderCard(trainingSession: trainingData[0])
    }
}
