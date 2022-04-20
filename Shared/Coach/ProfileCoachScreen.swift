//
//  ProfileCoachScreen.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 16/4/22.
//

import SwiftUI

struct ProfileCoachScreen: View {
    var body: some View {
        ZStack {
            VStack(spacing: 55){
                ZStack(alignment: .top){
                    Rectangle()
                        .foregroundColor(Color("blueColor"))
                        .frame(width: UIScreen.main.bounds.width,
                               height: 200)
                    CoachCard(imageString: "ic_women",
                              name: "Coach name",
                              email: "emailCoach@gmail.com")
                        .padding(.top, 60)
                }
                VStack(alignment: .center, spacing: 26){
                    ButtonProfileScreen(image: "ic_dashboard",
                                        name: "coach_dashboard")
                    ButtonProfileScreen(image: "ic_feedback",
                                        name: "coach_feedback_events")
                    ButtonProfileScreen(image: "ic_contacts",
                                        name: "coach_contacts")
                    ButtonProfileScreen(image: "ic_logout",
                                        name: "coach_logout")
                }
                RemoveButton(stringButton: "remove_account")
            }
        }
        .padding(.top, 25)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
    }
}

struct ButtonProfileScreen: View {
    var image: String
    var name: String

    var body: some View {
        Button(action: {}) {
            HStack (spacing: 32){
                Image(image)
                    .resizable()
                    .frame(width: 34, height: 34)
                    .padding(8)
                    .background(Color("blueColor"))
                    .cornerRadius(56)
                Text(LocalizedStringKey(name))
                    .font(.system(size: 23))
                    .foregroundColor(.black)
            }
            .frame(width: UIScreen.main.bounds.width / 1.5, height: 60, alignment: .leading)
        }.buttonStyle(.plain)
    }
}

struct ProfileCoachScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCoachScreen()
    }
}
