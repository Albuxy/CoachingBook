//
//  CoachCard.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 10/4/22.
//

import SwiftUI

struct CoachCard: View {

    var imageString: String
    var name: String
    var email: String

    @State var navigateToPersonalInformation = false

    var body: some View {
        ZStack{
            VStack(alignment: .trailing, spacing: 0){
                NavigationLink(
                    destination: CoachInformationScreen(imageString: imageString),
                  isActive: $navigateToPersonalInformation,
                  label: {
                      Button(action: {
                          navigateToPersonalInformation.toggle()
                      }) {
                          Image("ic_edit_info")
                              .resizable()
                              .frame(width: 22, height: 22)
                              .background(Color.clear)
                      }
                      .padding(.top, 10)
                      .padding(.trailing, -10)
                  }
                )
                VStack(alignment: .center, spacing: 10) {
                    Image(imageString)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .border(.gray)
                        .cornerRadius(4)
                    VStack(alignment: .center, spacing: 10) {
                        Text(name)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                        Text(email)
                            .font(.system(size: 16))
                            .bold()
                            .foregroundColor(.gray)
                    }
                }
                .padding(.top)
            }
            .frame(width: 300, height: 200, alignment: .top)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(Color("blueColor"), lineWidth: 3)
                    .background(
                        RoundedRectangle(cornerRadius: 20).fill(Color.white)
                    )
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
            )
        }
    }
}

struct CoachCard_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCoachScreen()
    }
}
