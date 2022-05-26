//
//  PrepareTrainingCard.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 23/5/22.
//

import SwiftUI

struct PrepareTrainingCard: View {
    
    @State var navigateToPreparation = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            HStack(spacing: 30) {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 3.0)
                        .foregroundColor(Color.init(hex: "74572B"))
                    Circle()
                        .trim(from: 0.0, to: CGFloat(0.6))
                        .stroke(style: StrokeStyle(lineWidth: 3.0, lineCap: .round, lineJoin: .round))
                        .foregroundColor(.white)
                    Text("\(Int(0.6 * 100))" + " %")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .bold()
                }
                .frame(width: 60, height: 60)
                VStack(alignment: .leading, spacing: 10){
                    Text("home_preparation_progress".localized(LocalizationService.shared.language))
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                    Text("home_preparation_training".localized(LocalizationService.shared.language))
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
                                       color: Color("brownLightColor"))
              }
            )
        }
        .padding(.leading, 30)
        .frame(width: 303, height: 150, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(Color.clear, lineWidth: 1)
                .background(
                    Image("orangeBackground")
                        .resizable()
                        .frame(width: 303, height: 160)
                        .cornerRadius(15)
                )
        )
        
    }
}

struct ButtonWithNavigation: View {
    
    @Binding var boolean: Bool
    var title: String
    var color: Color
    
    var body: some View{
        Button {
            boolean.toggle()
        } label: {
            HStack{
                Text(title.localized(LocalizationService.shared.language))
                    .font(.system(size: 14))
                    .bold()
                    .foregroundColor(color)
                Image(systemName: "arrowtriangle.right.fill")
                    .resizable()
                    .frame(width: 8, height: 8)
                    .foregroundColor(color)
            }
            .padding([.top, .bottom], 8)
            .padding([.leading, .trailing], 10)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(Color.clear, lineWidth: 1)
                    .background(
                        RoundedRectangle(cornerRadius: 10).fill(Color.white)
                    )
            )
        }
    }
}

struct PrepareTrainingCard_Previews: PreviewProvider {
    static var previews: some View {
        PrepareTrainingCard()
    }
}
