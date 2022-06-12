//
//  TeamInformationView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 8/5/22.
//

import SwiftUI

struct TeamInformationView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var team: TeamListModel
    
    @State var newCategory = ""
    @State var trainingVariable1 = ""
    @State var trainingVariable2 = ""
    @State var matchVariable = ""
    @State var newHourTraining1 = ""
    @State var newHourTraining2 = ""
    @State var newHourMatch = ""

    var body: some View {
        VStack(spacing: 20){
            ZStack(alignment: .top){
                Rectangle()
                    .foregroundColor(Color("thirdLightBlueColor"))
                    .frame(width: UIScreen.main.bounds.width,
                           height: 240)
                TeamPrincipalInfoCard(newCategory: $newCategory, team: team)
                    .padding(.top, 55)
            }
            VStack(spacing: 20){
                Text("training_sessions_title".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 19))
                HStack{
                    VStack(alignment: .leading, spacing: 15){
                        Text("days_title".localized(LocalizationService.shared.language))
                            .foregroundColor(.black)
                            .font(.system(size: 19))
                            .underline()
                        OptionsListView(placeholder: team.teamsList[0].trainingDays[0].getStringsForDay(currentDay: team.teamsList[0].trainingDays[0].day),
                                        dropDownList: team.daysWeek,
                                        value: $trainingVariable1)
                        OptionsListView(placeholder: team.teamsList[0].trainingDays[1].getStringsForDay(currentDay: team.teamsList[0].trainingDays[1].day),
                                        dropDownList: team.daysWeek,
                                        value: $trainingVariable2)
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 25){
                        Text("hour_title".localized(LocalizationService.shared.language))
                            .foregroundColor(.black)
                            .font(.system(size: 19))
                            .underline()
                        TextField(team.teamsList[0].trainingDays[0].hour, text: $newHourTraining1)
                            .keyboardType(.numberPad)
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .frame(width: 60, height: 30, alignment: .center)
                        TextField(team.teamsList[0].trainingDays[1].hour, text: $newHourTraining2)
                            .keyboardType(.numberPad)
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .frame(width: 60, height: 30, alignment: .center)
                    }
                }
                .padding([.leading, .trailing], 30)
                .frame(width: 320, height: 120, alignment: .topLeading)
                
                Text("local_matches_title".localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(.system(size: 19))
                HStack{
                    VStack(alignment: .leading, spacing: 20){
                        Text("days_title".localized(LocalizationService.shared.language))
                            .foregroundColor(.black)
                            .font(.system(size: 19))
                            .underline()
                        OptionsListView(placeholder: team.teamsList[0].matchDay.getStringsForDay(currentDay: team.teamsList[0].matchDay.day),
                                        dropDownList: team.dayWeekend,
                                        value: $matchVariable)
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 25){
                        Text("hour_title".localized(LocalizationService.shared.language))
                            .foregroundColor(.black)
                            .font(.system(size: 19))
                            .underline()
                        TextField(team.teamsList[0].matchDay.hour, text: $newHourMatch)
                            .keyboardType(.numberPad)
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .frame(width: 60, height: 30, alignment: .center)
                    }
                }
                .padding([.leading, .trailing], 30)
                .frame(width: 320, height: 350, alignment: .topLeading)
            }
            .padding(.top, 20)
            .frame(width: 320, height: 340, alignment: .top)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(Color.clear, lineWidth: 3)
                    .background(
                        RoundedRectangle(cornerRadius: 15).fill(Color.white)
                    )
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
            )
            // MARK: - Button save details
            Button(action: {
                saveDetails()
                presentation.wrappedValue.dismiss()
            }) {
                Text("button_save_details".localized(LocalizationService.shared.language))
                    .font(.system(size: 16))
                    .bold()
            }.buttonStyle(
                MediumButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
            ).padding(.top, 50)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
        .background(Color("fourthLightBlueColor"))
        .navigationBarTitle(Text("team_information_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
          })
    }

    func saveDetails(){
        if trainingVariable1 != "" {
            team.teamsList[0].trainingDays[0].day = changeToDay(day: trainingVariable1)
        }
        if trainingVariable2 != "" {
            team.teamsList[0].trainingDays[1].day = changeToDay(day: trainingVariable2)
        }
        if newHourTraining1 != "" {
            team.teamsList[0].trainingDays[0].hour = newHourTraining1
        }
        if newHourTraining2 != "" {
            team.teamsList[0].trainingDays[1].hour = newHourTraining2
        }
        if matchVariable != "" {
            team.teamsList[0].matchDay.day = changeToDay(day: matchVariable)
        }
        if newHourMatch != "" {
            team.teamsList[0].matchDay.hour = newHourMatch
        }
    }
    
    func changeToDay(day: String) -> Day {
        if day == "monday_title".localized(LocalizationService.shared.language) {
            return .monday
        } else if day == "tuesday_title".localized(LocalizationService.shared.language) {
            return .tuesday
        } else if day == "wednesday_title".localized(LocalizationService.shared.language) {
            return .wednesday
        } else if day == "thursday_title".localized(LocalizationService.shared.language) {
            return .thursday
        } else if day == "friday_title".localized(LocalizationService.shared.language) {
            return .friday
        } else if day == "saturday_title".localized(LocalizationService.shared.language) {
            return .saturday
        } else {
            return .sunday
        }
    }
}

struct TeamPrincipalInfoCard: View {

    @Binding var newCategory: String
    @ObservedObject var team: TeamListModel

    var body: some View {
        VStack(alignment: .center, spacing: 15){
            Image(team.teamsList[0].logoString)
                .resizable()
                .frame(width: 100, height: 100)
            VStack(alignment: .center, spacing: 8){
                Text(team.teamsList[0].name)
                    .font(.system(size: 21))
                    .foregroundColor(.black)
                    .bold()
                TextField(team.teamsList[0].category, text: $newCategory)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .frame(width: 90, height: 30, alignment: .center)
            }
            HStack(spacing: 12){
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
                Text("\(team.teamsList[0].players.count)" + " players")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
            }
        }
        .padding(.top, 20)
        .frame(width: 320, height: 250, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .strokeBorder(Color.clear, lineWidth: 3)
                .background(
                    RoundedRectangle(cornerRadius: 15).fill(Color.white)
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        )
    }
}

struct OptionsListView: View {

    var placeholder: String
    var dropDownList: [String]
    @Binding var value: String

    var body: some View {
        Menu {
            ForEach(dropDownList, id: \.self){ option in
                Button(option.localized(LocalizationService.shared.language)) {
                    self.value = option
                }
            }
        } label: {
            VStack(spacing: 5){
                HStack{
                    Text(value.isEmpty ? placeholder.localized(LocalizationService.shared.language) : value.localized(LocalizationService.shared.language))
                        .foregroundColor(value.isEmpty ? .gray : .black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(Color.black)
                        .font(Font.system(size: 18))
                }
                .padding(.horizontal)
            }
            .frame(width: 150, height: 35, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.gray, lineWidth: 1)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                    )
            )
        }
    }
}

struct TeamInformationView_Previews: PreviewProvider {
    static var previews: some View {
        TeamInformationView(team: TeamListModel())
    }
}
