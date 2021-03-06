//
//  StatsPunctualityCard.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 9/5/22.
//

import SwiftUI

struct StatsPunctualityCard: View {
    
    var stats: PunctualityStats

    var body: some View {
        ZStack{
            VStack(spacing: 20){
                Text("punctuality_analysis_title".localized(LocalizationService.shared.language))
                    .font(.system(size: 26))
                    .foregroundColor(Color("baseColor"))
                    .bold()
                    .padding(.top, 30)
                SectionPunctualityInStats(progress: stats.percMatchTotal,
                                          title: "match_title",
                                          description: "punctuality_match",
                                          lessThan: "\(stats.LowMatch)",
                                          equalTo: "\(stats.MediumMatch)",
                                          moreThan: "\(stats.HighMatch)",
                                          totalNumber: "\(12)")
                Divider()
                    .frame(width: UIScreen.main.bounds.width / 1.5, alignment: .leading)
                    .background(.black)
                SectionPunctualityInStats(progress: stats.percTrainingTotal,
                                          title: "training_title",
                                          description: "punctuality_training",
                                          lessThan: "\(stats.LowTraining)",
                                          equalTo: "\(stats.MediumTraining)",
                                          moreThan: "\(stats.HighTraining)",
                                          totalNumber: "\(20)")
                
            }
            .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 1.55, alignment: .top)
            .background(Color("greenBackgroundLightColor"))
            .cornerRadius(24)
        }
    }
}

struct SectionPunctualityInStats: View {
    
    var progress: Float
    var title: String
    var description: String
    var lessThan: String
    var equalTo: String
    var moreThan: String
    var totalNumber: String
    
    var body: some View {
        VStack(spacing: 20){
            PercentatgeWithTitleStats(progress: progress,
                                      title: title,
                                      description: description,
                                      color: Color("baseColor"))
            VStack(alignment: .leading, spacing: 15){
                Text("???  -")
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                + Text("comparate_title".localized(LocalizationService.shared.language))                    .foregroundColor(.black)
                    .font(.system(size: 18))
                + Text("5 min:  1/" + totalNumber + "attendance_total".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                Text("???  -")
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                + Text("comparate_title".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                + Text("15 min:  3/" + totalNumber + "attendance_total".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                Text("???  +") + Text("comparate_title".localized(LocalizationService.shared.language)) + Text("15 min:  5/" + totalNumber + "attendance_total".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 18))
            }
            .frame(width: UIScreen.main.bounds.width / 1.5, alignment: .leading)
        }
        .frame(width: UIScreen.main.bounds.width / 1.2, height: 220, alignment: .leading)
    }
}

struct StatsPunctualityCard_Previews: PreviewProvider {
    static var previews: some View {
        StatsPunctualityCard(stats: punctualityStatData)
    }
}
