//
//  ProfileAddPlayerView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 10/5/22.
//

import SwiftUI

struct ProfileAddPlayerView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    // MARK: - Player Information Properties
    @Binding var name: String
    @Binding var surname: String
    @Binding var dateOfBirth: Date?
    @Binding var gender: String
    
    var body: some View {
        VStack(spacing: 25){
            // MARK: - Image
            Image("ic_coachImage")
                .resizable()
                .frame(width: 120, height: 120)
                .border(.gray)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color("lightGrayColor"), lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.white)
                        )
                )

            TextFieldWithTitleGeneral(defaultTextFiled: "contact_name_title", placeHolder: "write_title".localized(LocalizationService.shared.language),
                                      stringTextField: $name)
            TextFieldWithTitleGeneral(defaultTextFiled: "coach_surname", placeHolder: "write_title".localized(LocalizationService.shared.language),
                                      stringTextField: $surname)
            VStack(alignment: .leading, spacing: 5){
                Text("coach_dateOfBirth"
                        .localized(LocalizationService.shared.language))
                        .foregroundColor(.black)
                DatePickerTextField(placeholder: "Choose".lowercased().localized(LocalizationService.shared.language),
                                    date: self.$dateOfBirth)
                    .foregroundColor(.black)
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
                        bgColor: Color("blueColor"),
                        isMarked: $gender.wrappedValue == "Male" ? true : false,
                        callback: { selected in
                            self.gender = selected
                        }
                    )
                    RadioButtonField(
                        id: "Female",
                        label: "coach_gender_female",
                        color:.black,
                        bgColor: Color("blueColor"),
                        isMarked: $gender.wrappedValue == "Female" ? true : false,
                        callback: { selected in
                            self.gender = selected
                        }
                    )
                }
            }
        }
    }
}

struct ProfileAddPlayerView_Previews: PreviewProvider {
    @State static var value1 = ""
    @State static var value2 = ""
    @State static var value3 = ""
    @State static var value4: Date?
    static var previews: some View {
        ProfileAddPlayerView(name: $value1, surname: $value2, dateOfBirth: $value4, gender: $value3)
    }
}
