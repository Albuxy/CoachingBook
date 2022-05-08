//
//  AddContactView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 3/5/22.
//

import SwiftUI

struct AddContactView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    @Binding var coach: Coach
    
    //Fields
    @State var name = ""
    @State var gender = ""
    @State var phoneNumber = ""
    @State var city = ""
    @State var email = ""
    @State var relation = ""
    @State var team = ""
    @State var playerName = ""
    
    let teamsList: [String] = teamsData.map { team in
        team.name
    }
    
    let playersList: [String] = playersData.map { player in
        player.name
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0){
                ScrollView{
                    VStack(spacing: 30){
                        TitleWithLineView(title: "contact_information_title")
                        VStack(spacing: 30){
                            ImageWithTextField(defaultString: "contact_name_title",
                                               imageString: "ic_name",
                                               stringTextField: $name)
                            DropDownOptionsField(imageString: "",
                                                 placeholder: "contact_gender_title",
                                                 dropDownList: ["coach_gender_male", "coach_gender_female", "reason_other_title"],
                                                 value: $gender)
                            ImageWithTextField(defaultString: "contact_phone_title",
                                               imageString: "ic_phone",
                                               stringTextField: $phoneNumber)
                            ImageWithTextField(defaultString: "contact_city_title",
                                               imageString: "ic_city",
                                               stringTextField: $city)
                            ImageWithTextField(defaultString: "contact_email_title",
                                               imageString: "ic_email",
                                               stringTextField: $email)
                        }
                        
                        TitleWithLineView(title: "relation_player_title")
                        VStack(spacing: 30){
                            DropDownOptionsField(imageString: "ic_typeRelation",
                                                 placeholder: "contact_relation_title",
                                                 dropDownList: ["reason_other_title", "mother_title", "father_title"],
                                                 value: $relation)
                            DropDownOptionsField(imageString: "ic_selectTeam",
                                                 placeholder: "contact_team_title",
                                                 dropDownList: teamsList,
                                                 value: $team)
                            DropDownOptionsField(imageString: "ic_selectPlayer",
                                                 placeholder: "contact_player_title",
                                                 dropDownList: playersList,
                                                 value: $playerName)
                        }
                    }
                    .padding(.top, 40)
                }
                // MARK: - Button
                Button {
                    let newContact = Contact(full_name: name,
                                             gender: changeToGender(gender: gender),
                                             phoneNumber: phoneNumber,
                                             relation: changeToRelation(relation: relation),
                                             playerRelated: lookForPlayer(playerName: playerName))
                    coach.contacts.append(newContact)
                    presentation.wrappedValue.dismiss()
                } label: {
                    Text("button_save_contact".localized(LocalizationService.shared.language))
                        .font(.system(size: 16))
                        .bold()
                }.buttonStyle(
                    MediumButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                )
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1)
        .background(Color("lightBlueColor"))
        .navigationBarTitle(Text("add_contact_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
                       
    func changeToGender(gender: String) -> Gender {
        if gender == "coach_gender_male".localized(LocalizationService.shared.language) {
            return .male
        } else if gender == "coach_gender_female".localized(LocalizationService.shared.language) {
            return .female
        } else {
            return .other
        }
    }
    
    func changeToRelation(relation: String) -> RelationTypeWithContact {
        if relation == "father_title".localized(LocalizationService.shared.language) {
            return .father
        } else if relation == "mother_title".localized(LocalizationService.shared.language) {
            return .mother
        } else {
            return .other
        }
    }
    
    func lookForPlayer(playerName: String) -> Player {
        let player: Player = playersData.filter { player in
            player.name == playerName
        }.first!
        return player
    }
}

struct ImageWithTextField: View {
    
    var defaultString: String
    var imageString: String
    @Binding var stringTextField: String
    
    var body: some View {
        HStack(spacing: 20){
            Image(imageString)
                .resizable()
                .frame(width: 32, height: 32)
            TextField("", text: $stringTextField)
                .foregroundColor(Color.black)
                .placeholder(Text(defaultString.localized(LocalizationService.shared.language))
                            .foregroundColor(.gray), show: stringTextField.isEmpty)
                .padding()
                .frame(width: 265, height: 45, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color.gray, lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white)
                        )
                )
                .overlay(
                    HStack {
                        if !self.stringTextField.isEmpty {
                            Spacer()
                            Button(action: {}) {
                                Image("ic_cancel")
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .onTapGesture {
                                        self.stringTextField = ""
                                    }
                            }
                            .padding()
                        }
                    }
                )
        }
    }
}

struct DropDownOptionsField: View {
    
    var imageString: String
    var placeholder: String
    var dropDownList: [String]
    @Binding var value: String

    var body: some View {
        HStack(spacing: 20){
            Image(imageString)
                .resizable()
                .frame(width: 32, height: 32)
            Menu {
                ForEach(dropDownList, id: \.self){ client in
                    Button(client.localized(LocalizationService.shared.language)) {
                        self.value = client
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
                .frame(width: 265, height: 45, alignment: .leading)
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
}

struct AddContactView_Previews: PreviewProvider {
    @State static var coach = coachData
    static var previews: some View {
        AddContactView(coach: $coach)
    }
}
