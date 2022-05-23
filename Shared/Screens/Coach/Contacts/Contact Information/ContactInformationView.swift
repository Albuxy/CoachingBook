//
//  ContactInformationView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 3/5/22.
//

import SwiftUI

struct ContactInformationView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    @State var listOfContacts = contactsData
    var currentContact: Contact
    
    @State var removeContact = false
    
    var body: some View {
        VStack(spacing: 30){
            ZStack(alignment: .top){
                Rectangle()
                    .foregroundColor(Color("blueColor"))
                    .frame(width: UIScreen.main.bounds.width,
                           height: 180)
                ContactCard(currentContact: currentContact)
                    .padding(.top, 30)
            }
            VStack(alignment: .center, spacing: 26){
                if let gender = currentContact.gender {
                    CustomRowInformationContact(title: "contact_gender_title",
                                                subtitle: getGenderInString(gender: gender).localized(LocalizationService.shared.language))
                }
                if let city = currentContact.city {
                    CustomRowInformationContact(title: "contact_city_title",
                                                subtitle: city)
                }
                if let email = currentContact.email {
                    CustomRowInformationContact(title: "contact_email_title",
                                                subtitle: email)
                }
                CustomRowInformationContact(title: "contact_phone_title",
                                            subtitle: currentContact.phoneNumber)
            }
            .frame(width: UIScreen.main.bounds.width / 1.4,
                    height: UIScreen.main.bounds.height / 2,
                    alignment: .topLeading)
            //Button Remove COntact
            Button(action: {
                listOfContacts.removeAll { contact in
                    contact.full_name == currentContact.full_name
                }
                presentation.wrappedValue.dismiss()
            }) {
                HStack (spacing: 38){
                    Image("ic_cancel_red")
                        .resizable()
                        .frame(width: 21, height: 21)
                    Text("button_remove_contact".localized(LocalizationService.shared.language))
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(.black)
                }
                .padding(.leading, 25)
                .frame(width: UIScreen.main.bounds.width / 1.35, height: 30, alignment: .leading)
            }
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color("redColor"), lineWidth: 3)
                    .background(
                        RoundedRectangle(cornerRadius: 8).fill(Color("redColor").opacity(0.22))
                    )
            )
        }
        .background(.white)
        .navigationBarTitle(Text("contact_information_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
    
    func getGenderInString(gender: Gender) -> String {
        switch gender {
        case .male:
            return "coach_gender_male".localized(LocalizationService.shared.language)
        case .female:
            return "coach_gender_female".localized(LocalizationService.shared.language)
        case .other:
            return "reason_other_title".localized(LocalizationService.shared.language)
        }
    }
}

struct CustomRowInformationContact: View {

    var title: String
    var subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(title.localized(LocalizationService.shared.language))
                .font(.system(size: 20))
                .foregroundColor(.gray)
            Text(subtitle)
                .font(.system(size: 18))
                .foregroundColor(.black)
        }
        .frame(width: 300, height: 70, alignment: .leading)
    }
}

struct ContactInformationView_Previews: PreviewProvider {
    static var previews: some View {
        ContactInformationView(currentContact: contactsData[0])
    }
}
