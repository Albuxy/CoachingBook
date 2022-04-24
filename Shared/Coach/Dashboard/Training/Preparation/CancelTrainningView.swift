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
            VStack(spacing: 40){
                VStack(spacing: 20){
                    Text("training_cancellation_title")
                        .font(.system(size: 24))
                        .bold()
                        .frame(width: UIScreen.main.bounds.width / 1.28, alignment: .leading)
                    Text("training_cancellation_subtitle")
                        .font(.system(size: 18))
                        .multilineTextAlignment(.leading)
                        .lineSpacing(8)
                }
                VStack(spacing: 30){
                    RadioButtonWithName(title: LocalizedStringKey("reason_rain_title").toString(),
                                        color: Color("brownDarkColor"),
                                        booleanToChange: $reasonSelected.wrappedValue == "Rain" ? true : false,
                                        callback: { selected in
                                            self.reasonSelected = selected
                                        })
                    RadioButtonWithName(title: LocalizedStringKey("reason_vacation_title").toString(),
                                        color: Color("brownDarkColor"),
                                        booleanToChange: $reasonSelected.wrappedValue == "Vacation" ? true : false,
                                        callback: { selected in
                                            self.reasonSelected = selected
                                        })
                    RadioButtonWithName(title: LocalizedStringKey("reason_injuries_title").toString(),
                                        color: Color("brownDarkColor"),
                                        booleanToChange: $reasonSelected.wrappedValue == "Injuries" ? true : false,
                                        callback: { selected in
                                            self.reasonSelected = selected
                                        })
                    VStack(spacing: 10){
                        RadioButtonWithName(title: LocalizedStringKey("reason_other_title").toString(),
                                            color: Color("brownDarkColor"),
                                            booleanToChange: $reasonSelected.wrappedValue == "Other" ? true : false,
                                            callback: { selected in
                                                self.reasonSelected = selected
                                            })
                        if reasonSelected == "Other" {
                            TextField(LocalizedStringKey("write_reason_title").toString(), text: $otherReasonSelected)
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
                        Text("cancel_training_title")
                            .font(.system(size: 16))
                            .bold()
                    }.buttonStyle(
                        MediumButtonStyle(textColor: Color.white, backgroundColor: Color("brownMediumColor"))
                    )
                }
                .padding([.leading, .trailing, .bottom], 48)
            }
        }
        .padding(.top, 50)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color("orangeDarkColor"), Color("orangeLightColor")]), startPoint: .leading, endPoint: .trailing))
        .navigationBarTitle(Text("cancel_training_title"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
}

struct CancelTrainningView_Previews: PreviewProvider {
    static var previews: some View {
        CancelTrainningView()
    }
}
