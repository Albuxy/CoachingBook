//
//  TotalRankingView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 15/5/22.
//

import SwiftUI

struct TotalRankingView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    var currentTeam: Team
    var top3 = playersData.sorted(by: { $0.totalStat < $1.totalStat })[0...2]
    var listSorted = playersData.sorted(by: { $0.totalStat < $1.totalStat }).enumerated().dropFirst(3)
    
    var body: some View {
        VStack(spacing: 23){
            VStack(spacing: 10){
                Text("total_ranking_stats_title"
                        .localized(LocalizationService.shared.language))
                    .font(.system(size: 26))
                    .foregroundColor(.black)
                    .bold()
                Text("total_ranking_stats_subtitle"
                        .localized(LocalizationService.shared.language))
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
            }
            .padding([.leading, .trailing], 40)
            PodiumView()
            ForEach(Array(listSorted), id: \.offset) { index, player in
                PositionRankingRow(namePlayer: player.name,
                                   currentPosition: index + 1)
            }
        }
        .padding(.top, 25)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
         .background(Color("fourthLightBlueColor"))
         .navigationBarTitle(Text("total_ranking_stats".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
          })
    }
}

struct PositionRankingRow: View {
    
    var namePlayer: String
    var currentPosition: Int
    
    var body: some View {
        HStack(spacing: 20){
            Text("\(currentPosition)")
                .foregroundColor(Color("blueColor"))
                .font(.system(size: 28))
                .bold()
            Text(namePlayer)
                .foregroundColor(.black)
                .font(.system(size: 23))
        }
        .padding([.leading, .trailing], 20)
        .frame(width: 330, height: 60, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.clear, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 15).fill(Color.white)
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        )
    }
}

struct PodiumView: View {
    var body: some View {
        ZStack{
            Image("ic_podium")
                .resizable()
                .frame(width: 300, height: 160)
                .padding()
                .padding(.top, 60)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(Color.clear, lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.2))
                        )
                )
            Image("ic_women")
                .resizable()
                .frame(width: 60, height: 60)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .strokeBorder(Color.clear, lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 40).fill(Color.white)
                        )
                )
                .padding(.top, -100)
            Image("ic_women")
                .resizable()
                .frame(width: 60, height: 60)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .strokeBorder(Color.clear, lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 40).fill(Color.white)
                        )
                )
                .padding(.leading, -140)
                .padding(.top, -40)
            Image("ic_women")
                .resizable()
                .frame(width: 60, height: 60)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .strokeBorder(Color.clear, lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 40).fill(Color.white)
                        )
                )
                .padding(.leading, 180)
                .padding(.top, -10)
            
        }
    }
}

struct TotalRankingView_Previews: PreviewProvider {
    static var previews: some View {
        TotalRankingView(currentTeam: teamsData[0])
    }
}
