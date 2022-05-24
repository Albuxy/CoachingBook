//
//  HomeView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 23/5/22.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    var body: some View {
        VStack(spacing: 0){
            ZStack(alignment: .top){
                Image("backgroundHome")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width,
                           height: 300)
                VStack(alignment: .leading, spacing: 15){
                    Text("home_title")
                        .foregroundColor(.white)
                        .font(.system(size: 38))
                        .multilineTextAlignment(.leading)
                        .frame(height: 100)
                    Text("home_description")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                    HStack(spacing: 30){
                        MiniCardTrainingHome(imageString: "ic_trainning_icon",
                                             titleString: "Training",
                                             descriptionString: "home_session_desc",
                                             color: Color("greenSuperMedium"))
                        MiniCardTrainingHome(imageString: "ic_match_icon",
                                             titleString: "Match",
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
            .accentColor(Color("blueColor"))
            .tabViewStyle(PageTabViewStyle())
       }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
        .background(Color("fourthLightBlueColor"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
