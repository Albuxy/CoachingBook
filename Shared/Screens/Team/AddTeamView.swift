//
//  AddTeamView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 12/6/22.
//

import SwiftUI

struct AddTeamView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var team: TeamListModel

    // MARK: - Team Information Properties
    @State var name = ""
    @State var category = ""
    @State var trainingDay1 = ""
    @State var trainingDay2 = ""
    @State var trainingHour1 = ""
    @State var trainingHour2 = ""
    @State var matchDay = ""
    @State var matchHour = ""
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            VStack{
                ScrollView{
                    VStack(spacing: 30){
                        TextFieldWithTitleGeneral(defaultTextFiled: "Name team", placeHolder: "write_title".localized(LocalizationService.shared.language),
                                                  stringTextField: $name)
                        TextFieldWithTitleGeneral(defaultTextFiled: "Category", placeHolder: "write_title".localized(LocalizationService.shared.language),
                                                  stringTextField: $category)
                        VStack(spacing: 80){
                            VStack(spacing: 20){
                                Text("training_sessions_title".localized(LocalizationService.shared.language))
                                    .foregroundColor(.black)
                                    .font(.system(size: 19))
                                HStack{
                                    VStack(alignment: .leading, spacing: 25){
                                        Text("days_title".localized(LocalizationService.shared.language))
                                            .foregroundColor(.black)
                                            .font(.system(size: 19))
                                            .underline()
                                        OptionsListView(placeholder: "choose_title".localized(LocalizationService.shared.language),
                                                        dropDownList: team.daysWeek,
                                                        value: $trainingDay1)
                                        OptionsListView(placeholder: "choose_title".localized(LocalizationService.shared.language),
                                                        dropDownList: team.daysWeek,
                                                        value: $trainingDay2)
                                    }
                                    Spacer()
                                    VStack(alignment: .leading, spacing: 25){
                                        Text("hour_title".localized(LocalizationService.shared.language))
                                            .foregroundColor(.black)
                                            .font(.system(size: 19))
                                            .underline()
                                        TextField("00:00", text: $trainingHour1)
                                            .keyboardType(.numbersAndPunctuation)
                                            .foregroundColor(.black)
                                            .font(.system(size: 20))
                                            .frame(width: 60, height: 30, alignment: .center)
                                        TextField("00:00", text: $trainingHour2)
                                            .keyboardType(.numbersAndPunctuation)
                                            .foregroundColor(.black)
                                            .font(.system(size: 20))
                                            .frame(width: 60, height: 30, alignment: .center)
                                    }
                                }
                                .frame(width: 320, height: 120, alignment: .topLeading)
                                
                            }
                            VStack(spacing: 20){
                                Text("local_matches_title".localized(LocalizationService.shared.language))
                                    .foregroundColor(.black)
                                    .font(.system(size: 19))
                                HStack{
                                    VStack(alignment: .leading, spacing: 20){
                                        Text("days_title".localized(LocalizationService.shared.language))
                                            .foregroundColor(.black)
                                            .font(.system(size: 19))
                                            .underline()
                                        OptionsListView(placeholder: "choose_title".localized(LocalizationService.shared.language),
                                                        dropDownList: team.dayWeekend,
                                                        value: $matchDay)
                                    }
                                    Spacer()
                                    VStack(alignment: .leading, spacing: 25){
                                        Text("hour_title".localized(LocalizationService.shared.language))
                                            .foregroundColor(.black)
                                            .font(.system(size: 19))
                                            .underline()
                                        TextField("00:00", text: $matchHour)
                                            .keyboardType(.numbersAndPunctuation)
                                            .foregroundColor(.black)
                                            .font(.system(size: 20))
                                            .frame(width: 60, height: 30, alignment: .center)
                                    }
                                }
                                .frame(width: 320, height: 100, alignment: .topLeading)
                            }
                        }
                        .padding(.top, 20)
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.4, alignment: .top)
                // MARK: - Button
                Button(action: {
                    let newTeam = Team(name: name,
                                         logoString: "ic_team",
                                         category: category,
                                         players: [],
                                       trainingDays: [Session(day: team.getDayFromString(day: trainingDay1),
                                                                hour: trainingHour1),
                                                        Session(day: team.getDayFromString(day: trainingDay2),
                                                                hour: trainingHour2)],
                                         matchDay: Session(day: team.getDayFromString(day: matchDay),
                                                           hour: matchHour))
                    team.addItem(item: newTeam)
                    presentation.wrappedValue.dismiss()
                }) {
                    Text("button_add_team".localized(LocalizationService.shared.language))
                        .font(.system(size: 16))
                        .bold()
                }.buttonStyle(
                    MediumButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                )
                .padding(.top, 50)
            }
            .padding(.top, 40)
            .background(Color("secondLightBlueColor"))
            }
        }
        .background(Color("secondLightBlueColor").opacity(0.4))
        .background(Color.white)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text("button_add_team".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
          })
    }
}

struct AddTeamView_Previews: PreviewProvider {
    static var previews: some View {
        AddTeamView(team: TeamListModel())
    }
}
