//
//  TeamAddPlayerView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 11/5/22.
//

import SwiftUI

struct TeamAddPlayerView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    // MARK: - Player Information Properties
    @Binding var contactNumber: String
    @Binding var position: String
    @Binding var dorsal: String
    
    let dropDownOptions = ["position_base".localized(LocalizationService.shared.language),
                           "position_escolta".localized(LocalizationService.shared.language),
                           "position_alero".localized(LocalizationService.shared.language),
                           "position_alapivot".localized(LocalizationService.shared.language),
                           "position_pivot".localized(LocalizationService.shared.language)]

    var body: some View {
        VStack(spacing: 25){
            TextFieldWithTitleGeneral(defaultTextFiled: "coach_mobile_number",
                                      stringTextField: $contactNumber)
            DropDownWithOptionsListView(title: "position",
                                    placeholder: "choose_title",
                                    dropDownList: dropDownOptions,
                                    value: $position)
            TextFieldWithTitleGeneral(defaultTextFiled: "dorsal_player_title",
                                      stringTextField: $dorsal)
        }
    }
}

struct DropDownWithOptionsListView: View {

    var title: String
    var placeholder: String
    var dropDownList: [String]
    @Binding var value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text(title.localized(LocalizationService.shared.language))
                .font(.system(size: 19))
                .foregroundColor(.black)
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
                .frame(width: 318, height: 50, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .strokeBorder(Color.gray, lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.white)
                        )
                )
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.22, alignment: .leading)
    }
}

struct TeamAddPlayerView_Previews: PreviewProvider {
    @State static var value1 = ""
    @State static var value2 = ""
    @State static var value3 = ""
    static var previews: some View {
        AddPlayerView()
    }
}
