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
    
    var team: Team
    var weeksDay: [String] = ["monday_title".localized(LocalizationService.shared.language),
                              "tuesday_title".localized(LocalizationService.shared.language),
                              "wednesday_title".localized(LocalizationService.shared.language),
                              "thursday_title".localized(LocalizationService.shared.language),
                              "friday_title".localized(LocalizationService.shared.language)]
    
    var weeks2Day: [String] = ["friday_title".localized(LocalizationService.shared.language),
                              "saturday_title".localized(LocalizationService.shared.language)]
    
    @State var removeTeam = false
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
                TeamPrincipalInfoCard(team: team)
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
                        OptionsListView(placeholder: team.trainingDays[0].getStringsForDay(currentDay: team.trainingDays[0].day),
                                        dropDownList: weeksDay,
                                        value: $trainingVariable1)
                        OptionsListView(placeholder: team.trainingDays[1].getStringsForDay(currentDay: team.trainingDays[1].day),
                                        dropDownList: weeksDay,
                                        value: $trainingVariable2)
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 25){
                        Text("hour_title".localized(LocalizationService.shared.language))
                            .foregroundColor(.black)
                            .font(.system(size: 19))
                            .underline()
                        TextField(team.trainingDays[0].hour, text: $newHourTraining1)
                            .keyboardType(.numberPad)
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .frame(width: 60, height: 30, alignment: .center)
                        TextField(team.trainingDays[1].hour, text: $newHourTraining2)
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
                        OptionsListView(placeholder: team.matchDay.getStringsForDay(currentDay: team.matchDay.day),
                                        dropDownList: weeks2Day,
                                        value: $matchVariable)
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 25){
                        Text("hour_title".localized(LocalizationService.shared.language))
                            .foregroundColor(.black)
                            .font(.system(size: 19))
                            .underline()
                        TextField(team.matchDay.hour, text: $newHourMatch)
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
            RemoveButton(stringButton: "button_remove_team", booleanToChange: $removeTeam)
                .padding(.top, 20)
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
}

struct TeamPrincipalInfoCard: View {

    var team: Team
    @State var newCategory = ""

    var body: some View {
        VStack(alignment: .center, spacing: 15){
            Image(team.logoString)
                .resizable()
                .frame(width: 100, height: 100)
            VStack(alignment: .center, spacing: 8){
                Text(team.name)
                    .font(.system(size: 21))
                    .foregroundColor(.black)
                    .bold()
                TextField(team.category, text: $newCategory)
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .frame(width: 90, height: 30, alignment: .center)
            }
            HStack(spacing: 12){
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
                Text("\(team.players.count)" + " players")
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
        TeamInformationView(team: teamsData[0])
    }
}
