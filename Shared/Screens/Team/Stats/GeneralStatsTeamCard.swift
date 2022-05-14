//
//  GeneralStatsTeamCard.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 14/5/22.
//

import SwiftUI

struct GeneralStatsTeamCard: View {

    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            HStack(spacing: 10){
                Image("ic_bullet_blue")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("stats_general_title".localized(LocalizationService.shared.language))
                    .font(.system(size: 15))
                    .bold()
                    .foregroundColor(.black)
                Spacer()
                Text("stats_unit_general_title".localized(LocalizationService.shared.language))
                    .font(.system(size: 13))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.4))
            }
            .padding([.leading, .trailing], 10)
            CombinedCircleView()
            HStack(spacing: 20){
                LitleTextWithPercentatge(title: "attendance_name",
                                         percentatge: "23,53%",
                                         color: Color("darkRedColor"))
                LitleTextWithPercentatge(title: "behaviour_name",
                                         percentatge: "48,28%",
                                         color: Color("blueColor"))
                LitleTextWithPercentatge(title: "punctuality_name",
                                         percentatge: "32,40%",
                                         color: Color("baseColor"))
            }
        }
        .frame(width: 340, height: 300, alignment: .center)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.clear, lineWidth: 3)
                .background(
                    RoundedRectangle(cornerRadius: 10).fill(Color.white)
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        )
    }
}

struct CombinedCircleView: View {
    var body: some View{
        ZStack {
            Circle()
                .trim(from: 0.0, to: 0.3)
                .stroke(style: StrokeStyle(lineWidth: 7.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color("blueColor"))
            Circle()
                .trim(from: 0.3, to: 0.7)
                .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color("darkRedColor"))
            Circle()
                .trim(from: 0.7, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 13.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color("baseColor"))
            VStack(spacing: 8){
                Text("60 %")
                    .font(.system(size: 21))
                    .foregroundColor(.black)
                    .bold()
                Text("attitude_title".localized(LocalizationService.shared.language))
                    .font(.system(size: 14))
                    .foregroundColor(.black.opacity(0.6))
            }
        }
        .frame(width: 100, height: 100)
    }
}

struct LitleTextWithPercentatge: View {

    var title: String
    var percentatge: String
    var color: Color

    var body: some View {
        HStack(alignment: .top){
            RoundedRectangle(cornerRadius: 3)
                .foregroundColor(color)
                .frame(width: 14, height: 14)
            VStack(spacing: 6){
                Text(title.localized(LocalizationService.shared.language))
                    .font(.system(size: 12))
                    .foregroundColor(.black.opacity(0.6))
                Text(percentatge)
                    .font(.system(size: 11))
                    .foregroundColor(.black)
            }
        }
    }
}

struct GeneralStatsTeamCard_Previews: PreviewProvider {
    static var previews: some View {
        GeneralStatsTeamCard()
    }
}
