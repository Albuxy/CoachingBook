//
//  ContactsListView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 2/5/22.
//

import SwiftUI

struct ContactsListView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    @State private var searchText = ""

    @ObservedObject var contacts = ContactsDetailModel()

    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 25){
                TitleWithLineView(title: "list_of_contacts_title")
                    .padding(.top, 20)
                ScrollView {
                    VStack(spacing: 25){
                        ForEach(contacts.contactsList.sorted(by: { $0.full_name < $1.full_name })) { contact in
                            CustomRowContact(viewModel: contacts, contact: contact)
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width / 1.3)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.2, alignment: .top)
        .background(Color("lightBlueColor"))
    }
}

struct CustomRowContact: View {

    @ObservedObject var viewModel: ContactsDetailModel
    @State var contact: Contact

    @State var navigateToContactInformation = false

    var body: some View {
        HStack(spacing: 20){
            Image(getStringForGender(gender: contact.gender))
                .resizable()
                .frame(width: 40, height: 40)
                .padding(5)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(Color("blueColor"), lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 25).fill(Color.white)
                        )
                )
            VStack(alignment: .leading, spacing: 10){
                Text(contact.full_name)
                    .font(.system(size: 21))
                    .foregroundColor(.black)
                HStack(spacing: 5){
                    Text(getStringForRelation(relation: contact.relation).localized(LocalizationService.shared.language))
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                    Text(contact.playerRelated.name)
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                }
            }
            .frame(width: 200, alignment: .leading)
            Spacer()
            HStack(spacing: 0){
                Button {
                    contact.isFavourite.toggle()
                } label: {
                    Image(systemName: contact.isFavourite ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color.yellow)
                }
                NavigationLink(
                  destination: ContactInformationView(currentContact: contact, contactsViewModel: viewModel),
                  isActive: $navigateToContactInformation,
                  label: {
                      Button {
                          navigateToContactInformation.toggle()
                      } label: {
                          Image("ic_arrow_right")
                              .resizable()
                              .frame(width: 22, height: 22)

                      }
                  }
                )
            }.onChange(of: contact.isFavourite) { newValue in
                contactsData.shuffle()
            }
        }
    }

    func getStringForRelation(relation: RelationTypeWithContact) -> String {
        switch relation {
        case .father:
            return "father_title"
        case .mother:
            return "mother_title"
        case .other:
            return "related_to_title"
        }
    }

    func getStringForGender(gender: Gender) -> String {
        switch gender {
        case .male:
            return "ic_men"
        case .female:
            return "ic_women"
        case .other:
            return ""
        }
    }
}

struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView(contacts: ContactsDetailModel())
    }
}
