//
//  PrepareMatchCard.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 24/5/22.
//

import SwiftUI

struct PrepareMatchCard: View {

    @State var navigateToPreparation = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            HStack(spacing: 30) {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 3.0)
                        .foregroundColor(Color.init(hex: "456F6C"))
                    Circle()
                        .trim(from: 0.0, to: CGFloat(0.2))
                        .stroke(style: StrokeStyle(lineWidth: 3.0, lineCap: .round, lineJoin: .round))
                        .foregroundColor(.white)
                    Text("\(Int(0.2 * 100))" + " %")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .bold()
                }
                .frame(width: 60, height: 60)
                VStack(alignment: .leading, spacing: 10){
                    Text("home_preparation_progress".localized(LocalizationService.shared.language))
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                    Text("home_preparation_match".localized(LocalizationService.shared.language))
                        .font(.system(size: 18))
                        .bold()
                        .foregroundColor(.white)
                }
                .frame(width: 180, height: 100, alignment: .leading)
            }
            .frame(width: 200, height: 100,alignment: .leading)
            NavigationLink(
              destination: DashboardOnBoardingView(),
              isActive: $navigateToPreparation,
              label: {
                  ButtonWithNavigation(boolean: $navigateToPreparation,
                                       title: "home_continue_preparation",
                                       color: Color.init(hex: "6AA5A1"))
              }
            )
        }
        .padding(.leading, 30)
        .frame(width: 303, height: 150, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(Color.clear, lineWidth: 1)
                .background(
                    Image("blueBackground")
                        .resizable()
                        .frame(width: 303, height: 160)
                        .cornerRadius(15)
                )
        )
        
    }
}

struct PrepareMatchCard_Previews: PreviewProvider {
    static var previews: some View {
        PrepareMatchCard()
    }
}
