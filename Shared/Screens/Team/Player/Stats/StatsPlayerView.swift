//
//  StatsPlayerView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 8/5/22.
//

import SwiftUI

struct StatsPlayerView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    var player: Player

    var body: some View {
        ZStack {
            VStack(spacing: 0){
                VStack(spacing: 10){
                    Text("stats_title"
                            .localized(LocalizationService.shared.language))
                        .font(.system(size: 26))
                        .foregroundColor(.black)
                        .bold()
                    Text("stats_subtitle"
                            .localized(LocalizationService.shared.language))
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(8)
                }
                TabView(){
                    StatsAttendanceCard(player: player)
                }
                .accentColor(Color("blueColor"))
                .tabViewStyle(PageTabViewStyle())
            }
            .padding(.top, 20)
            .padding([.leading, .trailing], 20)
            .background(Color("cremaColor"))
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
        .background(Color("fourthLightBlueColor"))
        .navigationBarTitle(Text("individual_stats_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
          })
    }
}

struct StatsPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        StatsPlayerView(player: playersData[0])
    }
}
