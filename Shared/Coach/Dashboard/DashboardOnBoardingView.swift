//
//  DashboardOnBoardingView.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 22/4/22.
//

import SwiftUI

struct DashboardOnBoardingView: View {

    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    var body: some View {
        ZStack {
            VStack(spacing: 0){
                VStack(spacing: 10){
                    Text("Start your preparation")
                        .font(.system(size: 26))
                        .bold()
                    Text("Start preparing your sessions to be ready for the date.")
                        .font(.system(size: 18))
                        .multilineTextAlignment(.center)
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
        .navigationBarTitle(Text("Dashboard"), displayMode: .inline)
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
