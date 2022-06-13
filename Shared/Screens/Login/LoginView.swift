//
//  LoginView.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 10/4/22.
//

import SwiftUI

struct LoginView: View {

    // MARK: - Login Properties
    @State private var user = ""
    @State private var password = ""
    @State private var keyboardHeight: CGFloat = 0
    
    @State var openApp = false
    @State var registerOption = false

    @ObservedObject var listOfPlayers = PlayersListModel()
    @ObservedObject var coachModel = CoachListModel()
    @ObservedObject var teamModel = TeamListModel()
    @ObservedObject var eventsModel = EventsListModel()
    @ObservedObject var matchModel = MatchListModel()
    @ObservedObject var fileModel = FilesModel()
    @ObservedObject var documentsList = DocumentModelList()
    @ObservedObject var imagesList = ImageModelList()
    @ObservedObject var videoslist = VideoModelList()

    var body: some View {
        NavigationView {
            GeometryReader { _ in
                VStack(spacing: 50){
                    Image("Logo")
                        .resizable()
                        .frame(width: 300, height: 130)
                    
                    VStack(spacing: 35) {

                        // MARK: - Fields Login
                        TextFieldGeneral(defaultTextFiled: "user_login",
                                         stringTextField: $user)
                        
                        VStack(spacing: 15){
                            SecureFieldGeneral(defaultTextFiled: "password_login",
                                               stringTextField: $password)
                            Button {
                                registerOption.toggle()
                            } label: {
                                Text("register_signIn".localized(LocalizationService.shared.language))
                                    .foregroundColor(Color.blue.opacity(0.6))
                            }
                        }


                        // MARK: - Button

                        NavigationLink(
                            destination: MenuControllerView(listOfPlayers: listOfPlayers,
                                                            coachModel: coachModel,
                                                            teamModel: teamModel,
                                                            eventsModel: eventsModel,
                                                            matchModel: matchModel,
                                                            fileModel: fileModel,
                                                            documentsList: documentsList,
                                                            imagesList: imagesList,
                                                            videoslist: videoslist),
                            isActive: self.$openApp
                        ) {
                            Button(action: {
                                self.openApp.toggle()
                            }) {
                                Text("login_signIn")
                                    .font(.system(size: 16))
                                    .bold()
                            }.buttonStyle(
                                SmallButtonStyle(textColor: Color.white,
                                                 backgroundColor: Color("blueColor"),
                                                 disabled: false)
                            )
                        }
                    }
                }
                .padding(.top, 100)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
                .background(Color.white)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .navigationAppearance(
                    backgroundColor: .white, foregroundColor: .black
                )
                .preferredColorScheme(.light)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
