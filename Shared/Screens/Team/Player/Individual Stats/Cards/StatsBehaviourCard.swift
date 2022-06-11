//
//  StatsBehaviourCard.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 9/5/22.
//

import SwiftUI

struct StatsBehaviourCard: View {
    
    var stats: BehaviourStats

    var body: some View {
        ZStack{
            VStack(spacing: 10){
                Text("behaviour_analysis_title".localized(LocalizationService.shared.language))
                    .font(.system(size: 26))
                    .foregroundColor(Color("blueColor"))
                    .bold()
                    .padding(.top, 30)
                SectionBehaviourInStats(progress: stats.mediaBehaviour,
                               title: "behaviour_title",
                               description: "behaviour_subtitle",
                                        totalTimes: "\(stats.puntuateTotalBehaviour)")
                Divider()
                    .frame(width: UIScreen.main.bounds.width / 1.5, alignment: .leading)
                    .background(.black)
                SectionBehaviourInStats(progress: stats.mediaAttitude,
                               title: "attitude_title",
                               description: "attitude_subtitle",
                                        totalTimes: "\(stats.puntuateTotalAttitude)")
            }
            .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 1.55, alignment: .top)
            .background(Color("secondDarkBlueColor"))
            .cornerRadius(24)
        }
    }
}

struct SectionBehaviourInStats: View {
    
    var progress: Int
    var title: String
    var description: String
    var totalTimes: String
    
    var body: some View {
        VStack(spacing: 20){
            CircleWithTitlesStats(progressValue: Float(progress) * 0.1,
                                      title: title,
                                      description: description,
                                  color: Color("blueColor"))
            HStack(spacing: 4){
                Text("behaviour_rated".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                + Text(" " + totalTimes + " times".localized(LocalizationService.shared.language))
                    .bold()
                    .foregroundColor(.black)
                    .font(.system(size: 18))
            }
            .frame(width: UIScreen.main.bounds.width / 1.5, alignment: .leading)
        }
        .frame(width: UIScreen.main.bounds.width / 1.2, height: 220, alignment: .leading)
    }
}



struct SectionAttitudeInStats: View {
    
    var progress: Float
    var title: String
    var description: String
    var totalTimes: String
    
    var body: some View {
        VStack(spacing: 20){
            CircleWithTitlesStats(progressValue: progress,
                                      title: title,
                                      description: description,
                                      color: Color("baseColor"))
            HStack(spacing: 4){
                Text("attitude_rated".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                + Text(" " + totalTimes + " times".localized(LocalizationService.shared.language))
                    .bold()
                    .foregroundColor(.black)
                    .font(.system(size: 18))
            }
            .frame(width: UIScreen.main.bounds.width / 1.5, alignment: .leading)
        }
        .frame(width: UIScreen.main.bounds.width / 1.2, height: 220, alignment: .leading)
    }
}

struct StatsBehaviourCard_Previews: PreviewProvider {
    static var previews: some View {
        StatsBehaviourCard(stats: behaviourStatData)
    }
}
