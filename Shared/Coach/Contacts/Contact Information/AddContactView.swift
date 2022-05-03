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
    
    let playersList: [String] = playersData1.map { player in
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
                                                 placeholder: "Gender",
                                                 dropDownList: ["Male", "Female", "Other"],
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
                                                 dropDownList: ["Other", "Mother", "Father"],
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
                    Text("button_save_contact")
                        .font(.system(size: 16))
                        .bold()
                }.buttonStyle(
                    MediumButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                )
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1)
        .background(Color("lightBlueColor"))
        .navigationBarTitle(Text("add_contact_title"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
                       
    func changeToGender(gender: String) -> Gender {
        if gender == "Male" {
            return .male
        } else if gender == "Female" {
            return .female
        } else {
            return .other
        }
    }
    
    func changeToRelation(relation: String) -> RelationTypeWithContact {
        if relation == "Father" {
            return .father
        } else if relation == "Mother" {
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
    
    var defaultString: LocalizedStringKey
    var imageString: String
    @Binding var stringTextField: String
    
    var body: some View {
        HStack(spacing: 20){
            Image(imageString)
                .resizable()
                .frame(width: 32, height: 32)
            TextField(defaultString.toString(), text: $stringTextField)
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
    var placeholder: LocalizedStringKey
    var dropDownList: [String]
    @Binding var value: String

    var body: some View {
        HStack(spacing: 20){
            Image(imageString)
                .resizable()
                .frame(width: 32, height: 32)
            Menu {
                ForEach(dropDownList, id: \.self){ client in
                    Button(client) {
                        self.value = client
                    }
                }
            } label: {
                VStack(spacing: 5){
                    HStack{
                        Text(value.isEmpty ? placeholder.toString() : value)
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

let playersData1: [Player] = [
    Player(name: "Name 1",
           surname: "Player",
           image: "ic_player"),
    Player(name: "Name 2",
           surname: "Player",
           image: "ic_player"),
    Player(name: "Name 3",
           surname: "Player",
           image: "ic_player"),
    Player(name: "Name 4",
           surname: "Player",
           image: "ic_player"),
    Player(name: "Name 5",
           surname: "Player",
           image: "ic_player"),
    Player(name: "Name 6",
           surname: "Player",
           image: "ic_player"),
    Player(name: "Name 7",
           surname: "Player",
           image: "ic_player")
]

struct AddContactView_Previews: PreviewProvider {
    @State static var coach = coachData
    static var previews: some View {
        AddContactView(coach: $coach)
    }
}
