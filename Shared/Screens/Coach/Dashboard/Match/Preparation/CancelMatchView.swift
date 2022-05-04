//
//  CancelMatchView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 27/4/22.
//

import SwiftUI

struct CancelMatchView: View {

    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    var currentMatch: Match
    @State var teamSelected = ""
    @State var reasonSelected = ""
    @State var otherReasonSelected = ""

    var body: some View {
        ZStack {
            VStack(spacing: 40){
                VStack(spacing: 20){
                    Text("match_cancellation_title".localized(LocalizationService.shared.language))
                        .font(.system(size: 23))
                        .bold()
                        .frame(width: UIScreen.main.bounds.width / 1.28, alignment: .center)
                    Text("match_cancellation_team".localized(LocalizationService.shared.language))
                        .font(.system(size: 19))
                        .multilineTextAlignment(.leading)
                        .lineSpacing(8)
                        .frame(width: UIScreen.main.bounds.width / 1.25, alignment: .leading)
                    HStack(spacing: 50){
                        OptionsTeamSelectView(imageString:  "ic_team",
                                    booleanToChange: $teamSelected.wrappedValue == "ic_team" ? true : false,
                                    callback: { selected in
                                        self.teamSelected = selected
                                    })
                        OptionsTeamSelectView(imageString: "ic_team2",
                                    booleanToChange: $teamSelected.wrappedValue == "ic_team2" ? true : false,
                                    callback: { selected in
                                        self.teamSelected = selected
                                    })
                    }
                }
                VStack(spacing: 30){
                    Text("match_cancellation_reason".localized(LocalizationService.shared.language))
                        .font(.system(size: 19))
                        .multilineTextAlignment(.leading)
                        .lineSpacing(8)
                        .frame(width: UIScreen.main.bounds.width / 1.25, alignment: .leading)
                    RadioButtonWithName(title: "reason_rain_title",
                                        color: Color("brownDarkColor"),
                                        booleanToChange: $reasonSelected.wrappedValue == "reason_rain_title".localized(LocalizationService.shared.language) ? true : false,
                                        callback: { selected in
                                            self.reasonSelected = selected
                                        })
                    RadioButtonWithName(title: "reason_vacation_title",
                                        color: Color("brownDarkColor"),
                                        booleanToChange: $reasonSelected.wrappedValue ==
                                        "reason_vacation_title".localized(LocalizationService.shared.language) ? true : false,
                                        callback: { selected in
                                            self.reasonSelected = selected
                                        })
                    RadioButtonWithName(title: "reason_injuries_title",
                                        color: Color("brownDarkColor"),
                                        booleanToChange: $reasonSelected.wrappedValue ==
                                        "reason_injuries_title".localized(LocalizationService.shared.language) ? true : false,
                                        callback: { selected in
                                            self.reasonSelected = selected
                                        })
                    VStack(spacing: 10){
                        RadioButtonWithName(title: "reason_other_title",
                                            color: Color("brownDarkColor"),
                                            booleanToChange: $reasonSelected.wrappedValue ==
                                            "reason_other_title".localized(LocalizationService.shared.language) ? true : false,
                                            callback: { selected in
                                                self.reasonSelected = selected
                                            })
                        if reasonSelected == "reason_other_title".localized(LocalizationService.shared.language) {
                            TextField("write_reason_title".localized(LocalizationService.shared.language), text: $otherReasonSelected)
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
                        Text("cancel_training_title".localized(LocalizationService.shared.language))
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
        .navigationBarTitle(Text("cancel_match_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
}

struct OptionsTeamSelectView: View {

    var imageString: String
    var booleanToChange: Bool
    let callback: (String)->()

    var body: some View {
        Button {
            self.callback(imageString)
        } label: {
            Image(imageString)
                .resizable()
                .frame(width: 60, height: 60)
        }
        .overlay(RoundedRectangle(cornerRadius: 2.0)
                    .strokeBorder(self.booleanToChange
                                  ? Color("blueColor")
                                  : Color.clear, style: StrokeStyle(lineWidth: 3.0)))

    }
}

struct CancelMatchView_Previews: PreviewProvider {
    static var previews: some View {
        CancelMatchView(currentMatch: matchData[0])
    }
}
