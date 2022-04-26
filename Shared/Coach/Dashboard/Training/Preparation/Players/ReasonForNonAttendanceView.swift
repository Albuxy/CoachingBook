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
                    RadioButtonWithName(title: LocalizedStringKey("reason_injurie").toString(),
                                        color: Color("blueColor"),
                                        booleanToChange: $reasonSelected.wrappedValue == "Injurie / Illness" ? true : false,
                                        callback: { selected in
                                            self.reasonSelected = selected
                                        })
                    RadioButtonWithName(title: LocalizedStringKey("reason_appointment").toString(),
                                        color: Color("blueColor"),
                                        booleanToChange: $reasonSelected.wrappedValue == "Appointment" ? true : false,
                                        callback: { selected in
                                            self.reasonSelected = selected
                                        })
                    RadioButtonWithName(title: LocalizedStringKey("reason_without_explanation").toString(),
                                        color: Color("blueColor"),
                                        booleanToChange: $reasonSelected.wrappedValue == "Without explanation" ? true : false,
                                        callback: { selected in
                                            self.reasonSelected = selected
                                        })
                    VStack(spacing: 10){
                        RadioButtonWithName(title: LocalizedStringKey("reason_other_title").toString(),
                                            color: Color("blueColor"),
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
                        Text("button_save_reason")
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
        .background(LinearGradient(gradient: Gradient(colors: [Color("blueMediumColor"), Color("blueLightColor")]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing))
        .navigationBarTitle(Text("for_non_attendance_reason_title"), displayMode: .inline)
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
        ReasonForNonAttendanceView(player: playersNotAssistData[0])
    }
}
