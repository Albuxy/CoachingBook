//
//  AddMatchView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 13/6/22.
//

import SwiftUI

struct AddMatchView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    //Properties match
    @State private var title = ""
    @State private var team1 = ""
    @State private var team2 = ""
    @State private var date: Date?
    @State private var hour = ""
    
    @ObservedObject var matchModel: MatchListModel

    var body: some View {
        GeometryReader { _ in
            VStack(spacing: 40) {
                Text("add_match_title".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 22))
                VStack(spacing: 30) {
                    TextFieldWithTitleGeneral(defaultTextFiled: "add_match_title_match",
                                              placeHolder: "write_title".localized(LocalizationService.shared.language),
                                              stringTextField: $title)
                    VStack(spacing: 30){
                        Text("add_match_teams_info")
                            .foregroundColor(.black)
                            .font(.system(size: 22))
                        VStack(spacing: 20){
                            TextFieldWithTitleGeneral(defaultTextFiled: "add_match_team1",
                                                      placeHolder: "write_title".localized(LocalizationService.shared.language),
                                                      stringTextField: $team1)
                            TextFieldWithTitleGeneral(defaultTextFiled: "add_match_team2",
                                                      placeHolder: "write_title".localized(LocalizationService.shared.language),
                                                      stringTextField: $team2)
                        }
                        
                    }
                    VStack(alignment: .center, spacing: 30){
                        Text("add_match_date_info".localized(LocalizationService.shared.language))
                            .foregroundColor(.black)
                            .font(.system(size: 22))
                            .frame(width: UIScreen.main.bounds.width / 1.3)
                        VStack(alignment: .leading, spacing: 20){
                            VStack(alignment: .leading, spacing: 5){
                                Text("add_match_date_match"
                                        .localized(LocalizationService.shared.language))
                                    .foregroundColor(.black)
                                DatePickerTextField(placeholder: "choose_title".lowercased().localized(LocalizationService.shared.language),
                                                    date: self.$date)
                                    .padding(.leading, 15)
                                    .frame(width: 320, height: 50, alignment: .center)
                                    .background(
                                        RoundedRectangle(cornerRadius: 5)
                                            .strokeBorder(Color("lightGrayColor"), lineWidth: 1)
                                            .background(
                                                RoundedRectangle(cornerRadius: 5)
                                                    .fill(Color.white)
                                            )
                                    )
                                
                            }
                            TextFieldWithTitleGeneral(defaultTextFiled: "add_match_hour_match",
                                                      placeHolder: "write_title".localized(LocalizationService.shared.language),
                                                      stringTextField: $hour)
                        }
                        
                    }
                }
                // MARK: - Button()!
                Button(action: {
                    let newMatch = Match(title: title,
                                         date: (date?.formatted())!,
                                         hour: hour,
                                         stringTeam1: team1,
                                         stringTeam2: team2,
                                         statusPreparation: .notPrepared,
                                         playersAssisting: [],
                                         playersNonAssisting: [])
                    matchModel.addItem(item: newMatch)
                    presentation.wrappedValue.dismiss()
                }) {
                    Text("button_add_match".localized(LocalizationService.shared.language))
                        .font(.system(size: 16))
                        .bold()
                }.buttonStyle(
                    MediumButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                )
            }
            .padding(.top, 20)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
            .background(Color("secondLightBlueColor").opacity(0.4))
            .background(Color.white)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle(Text("button_add_match".localized(LocalizationService.shared.language)), displayMode: .inline)
            .navigationBarItems(
              leading: Button(action: { presentation.wrappedValue.dismiss() }) {
                  Image("left_arrow")
                      .resizable()
                      .frame(width: 35, height: 35)
              })
        }
    }
}

struct AddMatchView_Previews: PreviewProvider {
    static var previews: some View {
        AddMatchView(matchModel: MatchListModel())
    }
}
