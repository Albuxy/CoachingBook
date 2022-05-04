//
//  TrainingDashboardCard.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 22/4/22.
//

import SwiftUI

struct TrainingDashboardCard: View {
    
    var trainings: [Training] = trainingData

    var body: some View {
        VStack(spacing: 15){
            VStack {
                VStack(alignment: .leading, spacing: 16){
                    Text("training_uppercased"
                            .localized(LocalizationService.shared.language))
                        .font(.system(size: 28))
                        .bold()
                        .frame(width: 280, height: 20, alignment: .leading)
                    Text("sessions_uppercased"
                            .localized(LocalizationService.shared.language))
                        .font(.system(size: 28))
                        .foregroundColor(Color("blueColor"))
                        .bold()
                        .frame(width: 170, height: 20)
                }
                Image("Training_preparation")
                    .resizable()
                    .frame(width: 200, height: 160)
                    .padding(.top, -30)
                    .padding(.leading, 60)
            }
            .padding(.top, 30)
            .frame(width: UIScreen.main.bounds.width / 1.2, height: 220, alignment: .top)
            VStack(alignment: .center, spacing: 15){
                ForEach(trainings.prefix(3)) { item in
                    MiniTrainingSessionCard(currentTrainingSession: item)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 1.40, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color("blueMediumColor"), Color("blueLightColor")]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing))
        .cornerRadius(24)
    }
}

struct TrainingDashboardCard_Previews: PreviewProvider {
    static var previews: some View {
        TrainingDashboardCard()
    }
}
