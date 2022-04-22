//
//  MiniDashboardCard.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 22/4/22.
//

import SwiftUI

struct MiniDashboardCard: View {
    
    var imageString: String
    var name: String
    var date: String

    @State var navigateToPreparationn = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 6){
            HStack(alignment: .top, spacing: 20) {
                Image(imageString)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.leading, -30)
                VStack(alignment: .leading, spacing: 5) {
                    Text(name)
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                    Text(date)
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(.gray)
                }
            }
            .padding(.top)
            Divider()
                .frame(height: 2)
                .background(Color("blueColor"))
            NavigationLink(
                destination: CoachInformationScreen(imageString: imageString),
              isActive: $navigateToPreparationn,
              label: {
                  Button(action: {
                      navigateToPreparationn.toggle()
                  }) {
                      Text("button_go_uppercased")
                          .font(.system(size: 15))
                          .bold()
                  }
                  .buttonStyle(
                      SuperSmallButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                  )
                
              }
            )
        }
        .frame(width: 275, height: 114, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(Color("blueColor"), lineWidth: 2)
                .background(
                    RoundedRectangle(cornerRadius: 12).fill(Color.white)
                )
        )
    }
}

struct MiniDashboardCard_Previews: PreviewProvider {
    static var previews: some View {
        MiniDashboardCard(imageString: "Match_session", name: "Training Session", date: "14/02/20")
    }
}
