//
//  ProfileCoachView.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 16/4/22.
//

import SwiftUI

struct ProfileCoachView: View {

    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    @ObservedObject var coachModel: CoachListModel
    @ObservedObject var contactModel: ContactsDetailModel

    @State var navigateToDashboard = false
    @State var navigateToFeedback = false
    @State var navigateToContacts = false
    @State var navigateToLogout = false

    @State var removeAccount = false

    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                ZStack(alignment: .top){
                    Rectangle()
                        .foregroundColor(Color("blueColor"))
                        .frame(width: UIScreen.main.bounds.width,
                               height: 180)
                    CoachCard(coach: coachModel)
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
                    NavigationLink(
                      destination: FeedbackView(),
                      isActive: $navigateToFeedback,
                      label: {
                          ButtonProfileScreen(image: "ic_feedback",
                                              name: "coach_feedback_events",
                                              booleanToChange: $navigateToFeedback)
                      }
                    )
                    NavigationLink(
                        destination: GeneralContactView(contactModel: contactModel),
                      isActive: $navigateToContacts,
                      label: {
                          ButtonProfileScreen(image: "ic_contacts",
                                              name: "coach_contacts",
                                              booleanToChange: $navigateToContacts)
                      }
                    )
                    ButtonProfileScreen(image: "ic_logout",
                                        name: "coach_logout",
                                        booleanToChange: $navigateToLogout)
                }
            }
            .alert(
              isPresented: $navigateToLogout,
              content: {
                Alert(
                  title: Text("button_log_out"),
                  message: Text("confirmation_log_out"),
                  primaryButton: .cancel(
                    Text("button_cancel"),
                    action: {}),
                  secondaryButton: .destructive(
                    Text("button_log_out"),
                    action: {
                      presentation.wrappedValue.dismiss()
                    }))
              })
        }
        .padding(.top, 90)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
        .background(Color("thirdLightBlueColor"))
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
                Text(name.localized(LocalizationService.shared.language))
                    .font(.system(size: 23))
                    .foregroundColor(.black)
            }
            .frame(width: UIScreen.main.bounds.width / 1.5, height: 60, alignment: .leading)
        }.buttonStyle(.plain)
    }
}

struct ProfileCoachScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCoachView(coachModel: CoachListModel(),
                         contactModel: ContactsDetailModel())
    }
}
