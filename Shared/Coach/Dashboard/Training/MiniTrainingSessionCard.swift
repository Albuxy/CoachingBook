//
//  MiniTrainingSessionCard.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 22/4/22.
//

import SwiftUI

struct MiniTrainingSessionCard: View {
    
    var currentTrainingSession: Training

    @State var navigateToPreparationn = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 6){
            HStack(alignment: .top, spacing: 20) {
                Image(currentTrainingSession.imageSession)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.leading, -30)
                VStack(alignment: .leading, spacing: 5) {
                    Text(currentTrainingSession.title)
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                    Text(currentTrainingSession.date)
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(.gray)
                }
            }
            .padding(.top)
            Divider()
                .frame(height: 2)
                .background(Color("blueColor"))
            NavigationLink(
                destination: TrainingPreparationView(currentTraining: currentTrainingSession),
              isActive: $navigateToPreparationn,
              label: {
                  Button(action: {
                      navigateToPreparationn.toggle()
                  }) {
                      Text("button_go_uppercased")
                          .font(.system(size: 15))
                          .bold()
                  }
                  .buttonStyle(
                      SuperSmallButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                  )
                
              }
            )
        }
        .frame(width: 275, height: 114, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(Color("blueColor"), lineWidth: 2)
                .background(
                    RoundedRectangle(cornerRadius: 12).fill(Color.white)
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        )
    }
}

struct MiniDashboardCard_Previews: PreviewProvider {
    static var previews: some View {
        MiniTrainingSessionCard(currentTrainingSession: trainingData[0])
    }
}
