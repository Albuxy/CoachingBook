//
//  HomeView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 23/5/22.
//

import SwiftUI
import UIKit

struct HomeView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    init() {
       UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("blueColor"))
       UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    @ObservedObject var team = TeamListModel()

    var body: some View {
        VStack(spacing: 0){
            ZStack(alignment: .top){
                Image("backgroundHome")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width,
                           height: 300)
                VStack(alignment: .leading, spacing: 15){
                    Text("home_title".localized(LocalizationService.shared.language))
                        .foregroundColor(.white)
                        .font(.system(size: 38))
                        .multilineTextAlignment(.leading)
                        .frame(height: 100)
                    Text("home_description".localized(LocalizationService.shared.language))
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                    HStack(spacing: 30){
                        MiniCardTrainingHome(imageString: "ic_trainning_icon",
                                             titleString: "training_title",
                                             descriptionString: "home_session_desc",
                                             color: Color("greenSuperMedium"))
                        MiniCardTrainingHome(imageString: "ic_match_icon",
                                             titleString: "match_title",
                                             descriptionString: "home_match_desc",
                                             color: Color("greenSuperMedium"))
                    }
                    .frame(height: 120)
                }
                .padding([.leading, .trailing], 30)
                .frame(width: UIScreen.main.bounds.width, height: 300, alignment: .leading)
            }
            TabView(){
                PrepareTrainingCard()
                PrepareMatchCard()
            }
            .background(Color("secondLightBlueColor"))
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 240, alignment: .top)
            TabView(){
                GetAssitanceCard(currentTeam: team.teamsList[0], team: team)
                GetBehaviourCard(currentTeam: team.teamsList[0], team: team)
            }
            .background(Color("secondLightBlueColor"))
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 240, alignment: .top)
            .padding(.top, -20)
       }
        .padding(.top, 90)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
        .background(Color("secondLightBlueColor"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
