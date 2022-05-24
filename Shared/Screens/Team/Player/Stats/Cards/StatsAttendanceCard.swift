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
            VStack(spacing: 20){
                Text("attendance_analysis_title".localized(LocalizationService.shared.language))
                    .font(.system(size: 26))
                    .foregroundColor(Color("darkRedColor"))
                    .bold()
                    .padding(.top, 30)
                SectionAttendanceInStats(progress: progressMatchValue,
                               title: "match_title",
                               description: "attendance_match",
                               numberInjuries: "\(1)",
                               numberOther: "\(5)",
                               totalNumber: "\(20)")
                Divider()
                    .frame(width: UIScreen.main.bounds.width / 1.5, alignment: .leading)
                    .background(.black)
                SectionAttendanceInStats(progress: progressTrainingValue,
                               title: "training_title",
                               description: "attendance_training",
                               numberInjuries: "\(3)",
                               numberOther: "\(0)",
                               totalNumber: "\(30)")
                
            }
            .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 1.55, alignment: .top)
            .background(Color("redLightColor"))
            .cornerRadius(24)
        }
    }
}

struct SectionAttendanceInStats: View {
    
    var progress: Float
    var title: String
    var description: String
    var numberInjuries: String
    var numberOther: String
    var totalNumber: String
    
    var body: some View {
        VStack(spacing: 20){
            PercentatgeWithTitleStats(progress: progress,
                                      title: title,
                                      description: description,
                                      color: Color("darkRedColor"))
            VStack(alignment: .leading, spacing: 15){
                Text("• " + "reason_injuries_title".localized(LocalizationService.shared.language) + ": ")
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                + Text(numberInjuries + "/" + totalNumber + "attendance_total".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                Text("• " + "reason_other_title".localized(LocalizationService.shared.language) + ": ")
                + Text(numberOther + "/" + totalNumber + "attendance_total".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 18))
            }
            .frame(width: UIScreen.main.bounds.width / 1.5, alignment: .leading)
        }
        .frame(width: UIScreen.main.bounds.width / 1.2, height: 220, alignment: .leading)
    }
}

struct StatsAttendanceCard_Previews: PreviewProvider {
    static var previews: some View {
        StatsAttendanceCard(player: Player(name: "",
                                           surname: "",
                                           image: "",
                                           date: "",
                                           position: .base,
                                           dorsal: 5,
                                           hasStats: true,
                                           totalStat: 7.8))
    }
}
