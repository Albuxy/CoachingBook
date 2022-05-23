//
//  CancelTrainningView.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 24/4/22.
//

import SwiftUI

struct CancelTrainningView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    @State var reasonSelected = ""
    @State var otherReasonSelected = ""

    var body: some View {
        ZStack {
            GeometryReader { _ in
                VStack(spacing: 40){
                    VStack(spacing: 20){
                        Text("training_cancellation_title"
                                .localized(LocalizationService.shared.language))
                            .foregroundColor(.black)
                            .font(.system(size: 23))
                            .bold()
                            .frame(width: UIScreen.main.bounds.width / 1.20, alignment: .leading)
                        Text("training_cancellation_subtitle"
                                .localized(LocalizationService.shared.language))
                            .foregroundColor(.black)
                            .font(.system(size: 19))
                            .multilineTextAlignment(.leading)
                            .lineSpacing(8)
                            .frame(width: UIScreen.main.bounds.width / 1.20, alignment: .leading)
                    }
                    VStack(spacing: 30){
                        RadioButtonWithName(title: "reason_rain_title",
                                            color: Color("brownDarkColor"),
                                            booleanToChange: $reasonSelected.wrappedValue == "reason_rain_title".localized(LocalizationService.shared.language) ? true : false,
                                            callback: { selected in
                                                self.reasonSelected = selected
                                            })
                        RadioButtonWithName(title: "reason_vacation_title",
                                            color: Color("brownDarkColor"),
                                            booleanToChange: $reasonSelected.wrappedValue == "reason_vacation_title".localized(LocalizationService.shared.language) ? true : false,
                                            callback: { selected in
                                                self.reasonSelected = selected
                                            })
                        RadioButtonWithName(title: "reason_injuries_title",
                                            color: Color("brownDarkColor"),
                                            booleanToChange: $reasonSelected.wrappedValue == "reason_injuries_title".localized(LocalizationService.shared.language) ? true : false,
                                            callback: { selected in
                                                self.reasonSelected = selected
                                            })
                        VStack(spacing: 10){
                            RadioButtonWithName(title: "reason_other_title",
                                                color: Color("brownDarkColor"),
                                                booleanToChange: $reasonSelected.wrappedValue == "reason_other_title".localized(LocalizationService.shared.language) ? true : false,
                                                callback: { selected in
                                                    self.reasonSelected = selected
                                                })
                            if reasonSelected == "reason_other_title".localized(LocalizationService.shared.language) {
                                TextField("", text: $otherReasonSelected)
                                    .foregroundColor(.black)
                                    .placeholder(Text("write_reason_title".localized(LocalizationService.shared.language))
                                    .foregroundColor(.gray), show: otherReasonSelected.isEmpty)
                                    .padding()
                                    .frame(width: UIScreen.main.bounds.width / 1.28, height: 100, alignment: .top)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .strokeBorder(Color("brownDarkColor"), lineWidth: 1)
                                            .background(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .fill(.white)
                                            )
                                    )
                            }
                        }
                        Spacer()
                        // MARK: - Button
                        Button(action: {
                            presentation.wrappedValue.dismiss()
                        }) {
                            Text("cancel_training_title"
                                    .localized(LocalizationService.shared.language))
                                .font(.system(size: 16))
                                .bold()
                        }.buttonStyle(
                            MediumButtonStyle(textColor: Color.white, backgroundColor: Color("brownMediumColor"))
                        )
                    }
                    .padding([.leading, .trailing, .bottom], 48)
                }
                .padding(.top, 50)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
                .background(LinearGradient(gradient: Gradient(colors: [Color("orangeDarkColor"), Color("orangeLightColor")]), startPoint: .leading, endPoint: .trailing))
                .navigationBarTitle(Text("cancel_training_title".localized(LocalizationService.shared.language)), displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(
                  leading: Button(action: { presentation.wrappedValue.dismiss() }) {
                      Image("left_arrow")
                          .resizable()
                          .frame(width: 35, height: 35)
                })
            }
        }
    }
}

struct CancelTrainningView_Previews: PreviewProvider {
    static var previews: some View {
        CancelTrainningView()
    }
}
