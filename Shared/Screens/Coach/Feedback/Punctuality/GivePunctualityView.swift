//
//  GivePunctualityView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 24/5/22.
//

import SwiftUI

struct GivePunctualityView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    var body: some View {
        ZStack{
            VStack(spacing: 40){
                VStack(spacing: 20){
                    Text("punctuality_give_title"
                            .localized(LocalizationService.shared.language))
                        .font(.system(size: 26))
                        .foregroundColor(.black)
                        .bold()
                    Text("punctuality_give_subtitle"
                            .localized(LocalizationService.shared.language))
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .lineSpacing(8)
                    Text("30/05/2022")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                }
                .padding([.leading, .trailing], 20)
                VStack(spacing: 30){
                    ForEach(playersData) { item in
                        RowForPlayerPunctuality(fullName: item.name + "  " + item.surname,
                                                checked: item.isChecked,
                                                value: item.tardance)
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
            .padding(.top, 90)
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height,
                   alignment: .top)
            .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "EADDFF"), Color.init(hex: "FDE0DC")]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing))
        }
        .navigationBarTitle(Text("punctuality_title_low".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
}

struct RowForPlayerPunctuality: View {
    var fullName: String
    var checked: Bool
    @State var value: String

    var body: some View {
        HStack{
            Text(fullName)
                .font(.system(size: 21))
                .foregroundColor(.black)
            Spacer()
            DropDownView(value: $value,
                         placeholder: "Choose",
                         dropDownList: ["on_time_title".localized(LocalizationService.shared.language),
                            "- 5 min", "5-10 min", "+ 10 min"])
                .frame(width: 140, height: 40)
        }
        .padding([.leading, .trailing], 40)
    }
}

struct GivePunctualityView_Previews: PreviewProvider {
    static var previews: some View {
        GivePunctualityView()
    }
}
