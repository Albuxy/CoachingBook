//
//  GiveAttitudeView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 26/5/22.
//

import SwiftUI

struct GiveAttitudeView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    @State var number = ""

    var body: some View {
        ZStack{
            GeometryReader { _ in
                VStack(spacing: 40){
                    VStack(spacing: 20){
                        Text("attitude_give_title"
                                .localized(LocalizationService.shared.language))
                            .font(.system(size: 26))
                            .foregroundColor(.black)
                            .bold()
                        Text("attitude_give_subtitle"
                                .localized(LocalizationService.shared.language))
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .lineSpacing(8)
                        Text("05/12/2018")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    .padding([.leading, .trailing], 20)
                    VStack(spacing: 30){
                        ForEach(playersData) { item in
                            RowForPlayerBehaviour(fullName: item.name + "  " + item.surname)
                        }
                    }
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }) {
                        Text("button_save_details".localized(LocalizationService.shared.language))
                            .font(.system(size: 16))
                            .bold()
                    }.buttonStyle(
                        MediumButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                    ).padding(.top, 20)
                }
                .padding(.top, 30)
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height,
                       alignment: .top)
                .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "FFF0DA"), Color.init(hex: "DEFEE5")]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing))
                
            }
        }
        .navigationBarTitle(Text("attitude_title_low".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
}

struct GGiveAttitudeFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        GiveAttitudeView()
    }
}
