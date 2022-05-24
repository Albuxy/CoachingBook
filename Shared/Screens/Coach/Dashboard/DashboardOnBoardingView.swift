//
//  DashboardOnBoardingView.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 22/4/22.
//

import SwiftUI
import UIKit

struct DashboardOnBoardingView: View {

    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    init() {
       UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("blueColor"))
       UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }

    var body: some View {
        ZStack {
            VStack(spacing: 0){
                VStack(spacing: 10){
                    Text("coach_dashboard_title"
                            .localized(LocalizationService.shared.language))
                        .font(.system(size: 26))
                        .foregroundColor(.black)
                        .bold()
                    Text("coach_dashboard_subtitle"
                            .localized(LocalizationService.shared.language))
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .lineSpacing(8)
                }
                TabView(){
                    TrainingDashboardCard()
                    MatchDashboardCard()
                }
                .accentColor(Color("blueColor"))
                .tabViewStyle(PageTabViewStyle())
            }
            .padding(.top, 20)
            .padding([.leading, .trailing], 20)
            .background(Color("cremaColor"))
        }
        .navigationBarTitle(Text("coach_dashboard".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
}

struct DashboardOnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardOnBoardingView()
    }
}
