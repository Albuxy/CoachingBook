//
//  StatsAttendanceCard.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 8/5/22.
//

import SwiftUI

struct StatsAttendanceCard: View {
    
    var player: Player
    var progressMatchValue: Float = 0.6
    var progressTrainingValue: Float = 0.34
    
    var body: some View {
        ZStack{
            VStack(spacing: 30){
                Text("attendance_analysis_title".localized(LocalizationService.shared.language))
                    .font(.system(size: 26))
                    .foregroundColor(Color("darkRedColor"))
                    .bold()
                    .padding(.top, 30)
                SectionInStats(progress: progressMatchValue,
                               title: "match_title",
                               description: "attendance_match",
                               numberInjuries: "\(1)",
                               numberOther: "\(5)",
                               totalNumber: "\(20)")
                Divider()
                    .frame(width: UIScreen.main.bounds.width / 1.6, alignment: .leading)
                    .background(.black)
                SectionInStats(progress: progressTrainingValue,
                               title: "training_title",
                               description: "attendance_training",
                               numberInjuries: "\(3)",
                               numberOther: "\(0)",
                               totalNumber: "\(30)")
                
            }
            .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 1.40, alignment: .top)
            .background(Color("redLightColor"))
            .cornerRadius(24)
        }
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
                Text(description.localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 18))
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.2, height: 100)
    }
    
}

struct SectionInStats: View {
    
    var progress: Float
    var title: String
    var description: String
    var numberInjuries: String
    var numberOther: String
    var totalNumber: String
    
    var body: some View {
        VStack(spacing: 40){
            PercentatgeWithTitleStats(progress: progress,
                                      title: title,
                                      description: description,
                                      color: Color("darkRedColor"))
            VStack(alignment: .leading, spacing: 15){
                Text("• Injuries:  " + numberInjuries + "/" + totalNumber + "attendance_total".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 21))
                Text("• Other:  " + numberOther + "/" + totalNumber + "attendance_total".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 21))
            }
            .frame(width: UIScreen.main.bounds.width / 1.5, alignment: .leading)
        }
        .frame(width: UIScreen.main.bounds.width / 1.2, height: 220, alignment: .leading)
    }
}

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

struct StatsAttendanceCard_Previews: PreviewProvider {
    static var previews: some View {
        StatsAttendanceCard(player: Player(name: "",
                                           surname: "",
                                           image: "",
                                           date: "",
                                           position: .base,
                                           dorsal: 5))
    }
}
