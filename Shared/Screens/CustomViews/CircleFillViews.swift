//
//  CircleFillViews.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 9/5/22.
//

import SwiftUI

struct CircleProgressView: View {
    var progressValue: Float
    var color: Color
    var colorBackground: Color
        
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 8.0)
                .foregroundColor(colorBackground)
            Circle()
                .trim(from: 0.0, to: CGFloat(self.progressValue))
                .stroke(style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
            Text("\(Int(progressValue * 100))" + " %")
                .font(.system(size: 21))
                .foregroundColor(color)
                .bold()
        }
        .frame(width: 80, height: 80)
    }
}

struct CircleWithTitlesStats: View {
    
    var progressValue: Float
    var title: String
    var description: String
    var color: Color

    var body: some View {
        HStack(spacing: 40){
            ZStack {
                Circle()
                    .stroke(lineWidth: 8.0)
                    .foregroundColor(.white)
                Circle()
                    .trim(from: 0.0, to: CGFloat(self.progressValue))
                    .stroke(style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(color)
                Text("\(Int(progressValue * 10))")
                    .font(.system(size: 21))
                    .foregroundColor(color)
                    .bold()
            }
            .frame(width: 80, height: 80)
            VStack(alignment: .leading, spacing: 10){
                Text(title.localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 21))
                    .bold()
                Text(description.localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 18))
            }
        }
        .padding([.leading, .trailing], 15)
        .frame(width: UIScreen.main.bounds.width / 1.2, height: 100, alignment: .center)
    }
}

struct PercentatgeWithTitleStats: View {
    
    var progress: Float
    var title: String
    var description: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 40){
            CircleProgressView(progressValue: progress, color: color, colorBackground: .white)
            VStack(alignment: .leading, spacing: 10){
                Text(title.localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 21))
                    .bold()
                Text(description.localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 18))
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.2, height: 100)
    }
    
}

struct StatsBehaviourCard1_Previews: PreviewProvider {
    static var previews: some View {
        StatsBehaviourCard(player: Player(name: "",
                                          surname: "",
                                          image: "",
                                          date: "",
                                          position: .base,
                                          dorsal: 5,
                                          hasStats: true,
                                          tardance: "",
                                          totalStat: 4.6))
    }
}
