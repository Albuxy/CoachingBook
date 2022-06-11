//
//  StatsPlayerEmptyView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 8/5/22.
//

import SwiftUI

struct StatsPlayerEmptyView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    var body: some View {
        ZStack {
            VStack(spacing: 70){
                Text("stats_empty_title".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 26))
                Image("ic_empty_stats")
                    .resizable()
                    .frame(width: 170, height: 170)
                Text("stats_empty_subtitle".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 21))
                    .multilineTextAlignment(.center)
                    .frame(width: UIScreen.main.bounds.width / 1.5)
            }
            .padding(.top, 70)
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

struct StatsPlayerEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        StatsPlayerEmptyView()
    }
}
