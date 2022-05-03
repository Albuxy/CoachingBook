//
//  CoachCard.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 10/4/22.
//

import SwiftUI

struct CoachCard: View {

    @Binding var coach: Coach

    @State var navigateToPersonalInformation = false

    var body: some View {
        ZStack{
            VStack(alignment: .trailing, spacing: -5){
                NavigationLink(
                    destination: CoachInformationScreen(),
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
                VStack(alignment: .center, spacing: 15) {
                    Image(coach.imageString)
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
                        Text(coach.full_name + coach.surname)
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                        Text(coach.email)
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
