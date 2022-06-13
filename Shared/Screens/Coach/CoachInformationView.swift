//
//  CoachInformationView.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 20/4/22.
//

import SwiftUI

struct CoachInformationScreen: View {

    // MARK: - Coach Information Properties
    @State private var surname = ""
    @State private var full_name = ""
    @State private var imageString = ""
    @State private var date: Date?
    @State private var gender = ""
    @State private var mobile_number = ""
    @State private var email = ""

    @ObservedObject var coach: CoachListModel

    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    var body: some View {
        ZStack {
            ScrollView{
                VStack(alignment: .center, spacing: 30){
                    // MARK: - Image
                    Image(imageString)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .padding()
                        .border(.gray)
                    // MARK: - Basic Information
                    Text("coach_basic_information".localized(LocalizationService.shared.language))
                        .font(.system(size: 21))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 45)

                    VStack(spacing: 20) {
                        //Fields
                        TextFieldWithTitleGeneral(defaultTextFiled: "coach_surname", placeHolder: coach.coachList.surname,
                                         stringTextField: $surname)
                        TextFieldWithTitleGeneral(defaultTextFiled: "coach_full_name", placeHolder: coach.coachList.full_name,
                                         stringTextField: $full_name)
                        VStack(alignment: .leading, spacing: 5){
                            Text("coach_dateOfBirth"
                                    .localized(LocalizationService.shared.language))
                                .foregroundColor(.black)
                            DatePickerTextField(placeholder: "choose_title".localized(LocalizationService.shared.language),
                                                date: self.$date)
                                .padding(.leading, 10)
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
                        VStack(alignment: .leading, spacing: 5){
                            Text("coach_gender"
                                    .localized(LocalizationService.shared.language))
                                .foregroundColor(.black)
                            HStack(spacing: 18){
                                RadioButtonField(
                                    id: "Male",
                                    label: "coach_gender_male",
                                    color:.black,
                                    bgColor: .black,
                                    isMarked: $gender.wrappedValue == "Male" ? true : false,
                                    callback: { selected in
                                        self.gender = selected
                                    }
                                )
                                .background(.white)
                                RadioButtonField(
                                    id: "Female",
                                    label: "coach_gender_female",
                                    color:.black,
                                    bgColor: .black,
                                    isMarked: $gender.wrappedValue == "Female" ? true : false,
                                    callback: { selected in
                                        self.gender = selected
                                    }
                                )
                                .background(.white)
                            }
                        }
                    }

                    // MARK: - Contact Setail
                    Text("coach_contact_detail"
                            .localized(LocalizationService.shared.language))
                        .font(.system(size: 21))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 45)
                    
                    VStack(spacing: 20) {
                        //Fields
                        TextFieldWithTitleGeneral(defaultTextFiled: "coach_mobile_number", placeHolder: coach.coachList.mobileNumber,
                                         stringTextField: $mobile_number)
                            .keyboardType(.numberPad)
                        TextFieldWithTitleGeneral(defaultTextFiled: "coach_email", placeHolder: coach.coachList.email,
                                         stringTextField: $email)
                    }
                }
                .ignoresSafeArea()
                .padding(.top, 30)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .topLeading)
                .background(Color("secondLightBlueColor"))
            }
            .overlay(
                ZStack{
                    Rectangle()
                        .foregroundColor(Color("secondLightBlueColor"))
                        .frame(width: UIScreen.main.bounds.width,
                               height: 120)
                    // MARK: - Button
                    Button(action: {
                        saveDetails()
                        presentation.wrappedValue.dismiss()
                    }) {
                        Text("button_save_details".localized(LocalizationService.shared.language))
                            .font(.system(size: 16))
                            .bold()
                    }.buttonStyle(
                        MediumButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                    )
                }.padding(.top, 750)
              )
        }
        .navigationBarTitle(Text("coach_information".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
          })
    }

    func saveDetails(){
        if surname != "" {
            coach.coachList.surname = surname
        }
        if full_name != "" {
            coach.coachList.full_name = full_name
        }
        if date?.formatted() != "" {
            coach.coachList.dateOfBirth = date ?? Date()
        }
        if gender != "" {
            coach.coachList.gender = gender
        }
        if mobile_number != "" {
            coach.coachList.mobileNumber = mobile_number
        }
        if email != "" {
            coach.coachList.email = email
        }
    }
    
}

struct TextFieldWithTitleGeneral: View {

    var defaultTextFiled: String
    var placeHolder: String
    @Binding var stringTextField: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text(defaultTextFiled.localized(LocalizationService.shared.language))
                .foregroundColor(.black)
            TextField("", text: $stringTextField)
                .foregroundColor(.black)
                .placeholder(Text(placeHolder)
                                .foregroundColor(.gray), show: stringTextField.isEmpty)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .strokeBorder(Color("lightGrayColor"), lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
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
                .frame(width: 320, height: 50, alignment: .leading)
        }
    }
}

struct CoachInformationScreen_Previews: PreviewProvider {
    static var previews: some View {
        CoachInformationScreen(coach: CoachListModel())
    }
}
