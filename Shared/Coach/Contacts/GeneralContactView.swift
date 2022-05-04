//
//  GeneralContactView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 3/5/22.
//

import SwiftUI

struct GeneralContactView: View {

    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var contactModel = ContactsDetailModel()
    @State var coach: Coach
    
    @State var navigateToAddContact = false
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
          VStack(alignment: .center, spacing: 0) {
              Rectangle()
                .foregroundColor(Color("blueColor"))
                .frame(height: 50, alignment: .top)
                .overlay(
                  CustomPickerContactBar(selection: contactModel)
                )
            GeometryReader { _ in
                SwitchContactView(userScreenEntry: $contactModel.showSection,
                                  currentCoach: coach)
              .frame(width: 380, alignment: .top)
              .padding([.leading, .trailing], 18)
            }
          }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text("contacts_title"), displayMode: .inline)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
          }, trailing:
            NavigationLink(
              destination: AddContactView(coach: $coach),
              isActive: $navigateToAddContact,
              label: {
                  Button(action: {
                      navigateToAddContact.toggle()
                  }) {
                    Image(systemName: "person.fill.badge.plus")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                }
              }
            )
        )
    }
}

struct GeneralContactView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralContactView(coach: coachData)
    }
}

class ContactsDetailModel: ObservableObject {
  @Published var showSection: ContactEntries = .contacts
}
