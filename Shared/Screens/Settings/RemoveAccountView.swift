//
//  RemoveAccountView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 4/5/22.
//

import SwiftUI

struct RemoveAccountView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    @State var showAlert = false
    @State var goToLogin = false

    var body: some View {
        ZStack{
            VStack(spacing: 340){
                VStack(spacing: 50){
                    Text("remove_account_title"
                            .localized(LocalizationService.shared.language))
                        .foregroundColor(.black)
                        .font(.system(size: 23))
                        .bold()
                        .frame(width: UIScreen.main.bounds.width / 1.25, alignment: .leading)
                    Text("remove_account_subtitle1"
                            .localized(LocalizationService.shared.language))
                        .foregroundColor(.black)
                        .font(.system(size: 19))
                        .multilineTextAlignment(.leading)
                        .lineSpacing(8)
                        .frame(width: UIScreen.main.bounds.width / 1.25, alignment: .leading)
                    Text("remove_account_subtitle2"
                            .localized(LocalizationService.shared.language))
                        .foregroundColor(.black)
                        .font(.system(size: 19))
                        .multilineTextAlignment(.leading)
                        .lineSpacing(8)
                        .frame(width: UIScreen.main.bounds.width / 1.25, alignment: .leading)
                    NavigationLink(destination: LoginView(),
                                   isActive: $goToLogin,
                                   label: { EmptyView() })
                }
                Button(action: {
                    showAlert.toggle()
                }) {
                    HStack (spacing: 38){
                        Image("ic_cancel_red")
                            .resizable()
                            .frame(width: 21, height: 21)
                        Text("remove_account_title".localized(LocalizationService.shared.language))
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(.red)
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
            .alert(
              isPresented: $showAlert,
              content: {
                Alert(
                  title: Text("Remove account"),
                  message: Text("confirmation_remove_account"),
                  primaryButton: .cancel(
                    Text("button_cancel"),
                    action: {}),
                  secondaryButton: .destructive(
                    Text("button_remove"),
                    action: {
                        goToLogin.toggle()
                    }))
              })
        }
        .padding(.top, 90)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
        .background(Color("lightBlueColor").opacity(0.7))
        .background(.white)
        .navigationBarTitle(Text("remove_account_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
}

struct RemoveAccountView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveAccountView()
    }
}
