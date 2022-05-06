//
//  ReasonForNonAttendanceView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 26/4/22.
//

import SwiftUI

struct ReasonForNonAttendanceView: View {

    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    var player: Player
    var colors: [Color]

    @State var reasonSelected = ""
    @State var otherReasonSelected = ""

    var body: some View {
        ZStack {
            VStack(spacing: 50){
                VStack(spacing: 20){
                    Text("non_attendance_reason_title")
                        .font(.system(size: 24))
                        .bold()
                        .frame(width: UIScreen.main.bounds.width / 1.28, alignment: .leading)
                    Text("non_attendance_reason_subtitle")
                        .font(.system(size: 18))
                        .multilineTextAlignment(.leading)
                        .lineSpacing(8)
                        .frame(width: UIScreen.main.bounds.width / 1.28, alignment: .leading)
                }
                VStack(spacing: 30){
                    RadioButtonWithName(title: "reason_injurie",
                                        color: Color("blueColor"),
                                        booleanToChange: $reasonSelected.wrappedValue == "reason_injurie".localized(LocalizationService.shared.language) ? true : false,
                                        callback: { selected in
                                            self.reasonSelected = selected
                                        })
                    RadioButtonWithName(title: "reason_appointment",
                                        color: Color("blueColor"),
                                        booleanToChange: $reasonSelected.wrappedValue == "reason_appointment".localized(LocalizationService.shared.language) ? true : false,
                                        callback: { selected in
                                            self.reasonSelected = selected
                                        })
                    RadioButtonWithName(title: "reason_without_explanation",
                                        color: Color("blueColor"),
                                        booleanToChange: $reasonSelected.wrappedValue == "reason_without_explanation".localized(LocalizationService.shared.language) ? true : false,
                                        callback: { selected in
                                            self.reasonSelected = selected
                                        })
                    VStack(spacing: 10){
                        RadioButtonWithName(title: "reason_other_title",
                                            color: Color("blueColor"),
                                            booleanToChange: $reasonSelected.wrappedValue == "reason_other_title".localized(LocalizationService.shared.language) ? true : false,
                                            callback: { selected in
                                                self.reasonSelected = selected
                                            })
                        if reasonSelected == "reason_other_title".localized(LocalizationService.shared.language) {
                            TextField("write_reason_title".localized(LocalizationService.shared.language), text: $otherReasonSelected)
                                .padding()
                                .frame(width: UIScreen.main.bounds.width / 1.28, height: 100, alignment: .top)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .strokeBorder(Color("blueColor"), lineWidth: 1)
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
                        Text("button_save_reason".localized(LocalizationService.shared.language))
                            .font(.system(size: 16))
                            .bold()
                    }.buttonStyle(
                        MediumButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                    )
                }
                .padding([.leading, .trailing, .bottom], 48)
            }
        }
        .padding(.top, 50)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [colors[0], colors[1]]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing))
        .navigationBarTitle(Text("for_non_attendance_reason_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
}

struct ReasonForNonEttendanceScreen_Previews: PreviewProvider {
    static var previews: some View {
        ReasonForNonAttendanceView(player: playersNotAssistData[0], colors: [Color("blueMediumColor"), Color("blueLightColor")])
    }
}
