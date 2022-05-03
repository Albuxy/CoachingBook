//
//  FavouritesContactsView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 3/5/22.
//

import SwiftUI

struct FavouritesContactsView: View {

    @Binding var coach: Coach

    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 25){
                TitleWithLineView(title: "favourites_title")
                    .padding(.top, 20)
                ScrollView {
                    VStack(spacing: 25){
                        ForEach(coach.contacts.sorted(by: { $0.full_name < $1.full_name })) { contact in
                            if contact.isFavourite {
                                CustomRowFavouriteContact(contact: contact)
                            }
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

struct CustomRowFavouriteContact: View {

    var contact: Contact

    @State var navigateToContactInformation = false

    var body: some View {
        Button {
            //
        } label: {
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
                        Text(getStringForRelation(relation: contact.relation))
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                        Text(contact.playerRelated.name)
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                    }
                }
                Spacer()
                Image("ic_arrow_right")
                    .resizable()
                    .frame(width: 22, height: 22)
            }
        }
        .frame(width: 350)
    }
    
    func getStringForRelation(relation: RelationTypeWithContact) -> String {
        switch relation {
        case .father:
            return "Father"
        case .mother:
            return "Mother"
        case .other:
            return "Related to"
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

struct FavouritesContactsView_Previews: PreviewProvider {
    @State static var value = coachData
    static var previews: some View {
        FavouritesContactsView(coach: $value)
    }
}
