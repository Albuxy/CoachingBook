//
//  ProfileCoachView.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 16/4/22.
//

import SwiftUI

struct ProfileCoachScreen: View {

    @State var navigateToDashboard = false
    @State var navigateToFeedback = false
    @State var navigateToContacts = false
    @State var navigateToLogout = false

    var body: some View {
        ZStack {
            VStack(spacing: 50) {
                ZStack(alignment: .top){
                    Rectangle()
                        .foregroundColor(Color("blueColor"))
                        .frame(width: UIScreen.main.bounds.width,
                               height: 180)
                    CoachCard(imageString: "ic_women",
                              name: "Coach name",
                              email: "emailCoach@gmail.com")
                        .padding(.top, 30)
                }
                VStack(alignment: .center, spacing: 26) {
                    NavigationLink(
                      destination: DashboardOnBoardingView(),
                      isActive: $navigateToDashboard,
                      label: {
                          ButtonProfileScreen(image: "ic_dashboard",
                                              name: "coach_dashboard",
                                              booleanToChange: $navigateToDashboard)
                      }
                    )
                    ButtonProfileScreen(image: "ic_feedback",
                                        name: "coach_feedback_events",
                                        booleanToChange: $navigateToFeedback)
                    ButtonProfileScreen(image: "ic_contacts",
                                        name: "coach_contacts",
                                        booleanToChange: $navigateToContacts)
                    ButtonProfileScreen(image: "ic_logout",
                                        name: "coach_logout",
                                        booleanToChange: $navigateToLogout)
                }
                RemoveButton(stringButton: "remove_account")
            }
            .padding(.top, -85)
        }
        .navigationBarTitle(Text("coach_profile"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
    }
}

struct ButtonProfileScreen: View {

    var image: String
    var name: String
    @Binding var booleanToChange: Bool

    var body: some View {
        Button(action: {
            booleanToChange.toggle()
        }) {
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