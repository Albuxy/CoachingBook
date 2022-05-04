//
//  ContactCard.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 3/5/22.
//

import SwiftUI

struct ContactCard: View {
    
    var currentContact: Contact

    @State var navigateToContactInformation = false
    
    var body: some View {
        ZStack{
            VStack(alignment: .trailing, spacing: -10){
                NavigationLink(
                  destination: EmptyView(),
                  isActive: $navigateToContactInformation,
                  label: {
                      Button(action: {
                          navigateToContactInformation.toggle()
                      }) {
                          Image("ic_edit_info")
                              .resizable()
                              .frame(width: 22, height: 22)
                              .background(Color.clear)
                      }
                      .padding([.top, .trailing], 20)
                      .frame(width: 280, height: 20, alignment: .trailing)
                  }
                )
                VStack(alignment: .center, spacing: 15) {
                    Image(getStringForGender(gender: currentContact.gender))
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(6)
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .strokeBorder(Color("blueColor"), lineWidth: 1)
                                .background(
                                    RoundedRectangle(cornerRadius: 40).fill(Color.white)
                                )
                        )
                    VStack(alignment: .center, spacing: 10) {
                        Text(currentContact.full_name)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                        HStack(spacing: 5){
                            Text(getStringForRelation(relation: currentContact.relation).localized(LocalizationService.shared.language))
                                .font(.system(size: 18))
                                .foregroundColor(.gray)
                            Text(currentContact.playerRelated.name)
                                .font(.system(size: 18))
                                .foregroundColor(.gray)
                        }
                    }
                }
                .frame(width: 280, height: 150, alignment: .center)
                .padding(.top)
            }
            .frame(width: 300, height: 200, alignment: .top)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(Color("blueColor"), lineWidth: 2)
                    .background(
                        RoundedRectangle(cornerRadius: 15).fill(Color.white)
                    )
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
            )
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

struct ContactCard_Previews: PreviewProvider {
    static var previews: some View {
        ContactCard(currentContact: contactsData[0])
    }
}
