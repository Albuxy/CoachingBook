//
//  StatsPunctualityCard.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 9/5/22.
//

import SwiftUI

struct StatsPunctualityCard: View {
    
    var player: Player
    var progressMatchValue: Float = 0.1
    var progressTrainingValue: Float = 0.72

    var body: some View {
        ZStack{
            VStack(spacing: 20){
                Text("punctuality_analysis_title".localized(LocalizationService.shared.language))
                    .font(.system(size: 26))
                    .foregroundColor(Color("baseColor"))
                    .bold()
                    .padding(.top, 30)
                SectionPunctualityInStats(progress: progressMatchValue,
                               title: "match_title",
                               description: "punctuality_match",
                               lessThan: "\(1)",
                               equalTo: "\(13)",
                               moreThan: "\(6)",
                               totalNumber: "\(20)")
                Divider()
                    .frame(width: UIScreen.main.bounds.width / 1.5, alignment: .leading)
                    .background(.black)
                SectionPunctualityInStats(progress: progressTrainingValue,
                               title: "training_title",
                               description: "punctuality_training",
                               lessThan: "\(1)",
                               equalTo: "\(3)",
                               moreThan: "\(2)",
                               totalNumber: "\(6)")
                
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
                Text("•  -") + Text("comparate_title".localized(LocalizationService.shared.language)) + Text("5 min:  1/" + totalNumber + "attendance_total".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                Text("•  -") + Text("comparate_title".localized(LocalizationService.shared.language)) + Text("15 min:  3/" + totalNumber + "attendance_total".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                Text("•  +") + Text("comparate_title".localized(LocalizationService.shared.language)) + Text("15 min:  5/" + totalNumber + "attendance_total".localized(LocalizationService.shared.language))
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
        StatsPunctualityCard(player: Player(name: "",
                                            surname: "",
                                            image: "",
                                            date: "",
                                            position: .base,
                                            dorsal: 5))
    }
}
