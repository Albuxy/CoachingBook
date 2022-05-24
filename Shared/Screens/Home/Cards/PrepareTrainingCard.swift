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
        VStack(alignment: .trailing, spacing: 5){
            HStack(spacing: 30) {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 3.0)
                        .foregroundColor(.black)
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
            .padding(.leading, 30)
            .frame(width: 200, height: 100,alignment: .leading)
            NavigationLink(
              destination: DashboardOnBoardingView(),
              isActive: $navigateToPreparation,
              label: {
                  Button {
                      navigateToPreparation.toggle()
                  } label: {
                      HStack{
                          Text("Continue preparation")
                              .font(.system(size: 14))
                              .bold()
                              .foregroundColor(Color("brownLightColor"))
                          Image(systemName: "arrowtriangle.right.fill")
                              .resizable()
                              .frame(width: 8, height: 8)
                              .foregroundColor(Color("brownLightColor"))
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
            )
        }
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

struct PrepareTrainingCard_Previews: PreviewProvider {
    static var previews: some View {
        PrepareTrainingCard()
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
