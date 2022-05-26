//
//  FeedbackView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 24/5/22.
//

import SwiftUI

struct FeedbackView: View {
    
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
                    Text("feedback_title"
                            .localized(LocalizationService.shared.language))
                        .font(.system(size: 26))
                        .foregroundColor(.black)
                        .bold()
                    Text("feedback_subtitle"
                            .localized(LocalizationService.shared.language))
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .lineSpacing(8)
                }
                TabView(){
                    PunctualityFeedbackCard()
                    BehaviourFeedbackCard()
                    AttitudeFeedbackCard()
                }
                .accentColor(Color("blueColor"))
                .tabViewStyle(PageTabViewStyle())
            }
            .padding(.top, 20)
            .padding([.leading, .trailing], 20)
            .background(Color("cremaColor"))
        }
        .navigationBarTitle(Text("feedback_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
