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
    
    var coach: Coach?

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
                        TextFieldWithTitleGeneral(defaultTextFiled: "coach_surname",
                                         stringTextField: $surname)
                        TextFieldWithTitleGeneral(defaultTextFiled: "coach_full_name",
                                         stringTextField: $full_name)
                        VStack(alignment: .leading, spacing: 5){
                            Text("coach_dateOfBirth"
                                    .localized(LocalizationService.shared.language))
                                .foregroundColor(.black)
                            DatePickerTextField(placeholder: "Choose".lowercased().localized(LocalizationService.shared.language),
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
                        TextFieldWithTitleGeneral(defaultTextFiled: "coach_mobile_number",
                                         stringTextField: $mobile_number)
                            .keyboardType(.numberPad)
                        TextFieldWithTitleGeneral(defaultTextFiled: "coach_email",
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
}

struct TextFieldWithTitleGeneral: View {

    var defaultTextFiled: String
    @Binding var stringTextField: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Text(defaultTextFiled.localized(LocalizationService.shared.language))
                .foregroundColor(.black)
            TextField("", text: $stringTextField)
                .foregroundColor(.black)
                .placeholder(Text("write_title".localized(LocalizationService.shared.language))
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
        CoachInformationScreen()
    }
}
