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
                if let adress = currentContact.adress {
                    CustomRowInformationContact(title: "contact_adress_title",
                                                subtitle: adress)
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
            }.frame(width: UIScreen.main.bounds.width / 1.4,
                    height: UIScreen.main.bounds.height / 2,
                    alignment: .topLeading)
            RemoveButton(stringButton: "button_remove_contact", booleanToChange: $removeContact)
        }
        .navigationBarTitle(Text("contact_information_title"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
}

struct CustomRowInformationContact: View {

    var title: String
    var subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(LocalizedStringKey(title))
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
