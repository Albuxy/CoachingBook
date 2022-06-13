//
//  EventTrainingCard.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 9/5/22.
//

import SwiftUI

struct EventTrainingCard: View {
    
    var training: Training
    @ObservedObject var trainingModel: TrainingListModel
    
    @State var navigateToInformation = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(training.title)
                        .bold()
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                    Text(training.date)
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(.gray)
                }
                Spacer()
                Text(training.getStringOfStatus(currentStatus: training.statusPreparation))
                    .padding([.leading, .trailing], 10)
                    .padding([.top, .bottom], 3)
                    .foregroundColor(training.getColorOfStatus(currentStatus: training.statusPreparation))
                    .font(.system(size: 14))
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.clear, lineWidth: 1)
                            .background(
                                RoundedRectangle(cornerRadius: 20).fill(training.getColorOfStatus(currentStatus: training.statusPreparation).opacity(0.2))
                            )
                    )
                        
            }
            .padding([.leading, .trailing], 20)
            .padding(.top)
            Divider()
                .background(Color.black)
            NavigationLink(
                destination: TrainingInformationView(currentTraining: training, trainingModel: trainingModel),
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
        .frame(width: 320, height: 125, alignment: .top)
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

struct EventTrainingCard_Previews: PreviewProvider {
    static var previews: some View {
        EventTrainingCard(training: trainingData[0], trainingModel: TrainingListModel())
    }
}
