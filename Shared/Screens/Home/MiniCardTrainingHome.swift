//
//  MiniCardTrainingHome.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 23/5/22.
//

import SwiftUI

struct MiniCardTrainingHome: View {
    
    var imageString: String
    var titleString: String
    var descriptionString: String
    var color: Color
    
    var body: some View {
        VStack(alignment: .trailing){
            VStack(alignment: .center) {
                HStack(spacing: 10){
                    Image(imageString)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(5)
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .strokeBorder(Color.black, lineWidth: 1)
                                .background(
                                    RoundedRectangle(cornerRadius: 40).fill(color)
                                )
                        )
                    Text(titleString.localized(LocalizationService.shared.language))
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(.black)
                }
                .frame(width: 130, height: 40, alignment: .leading)
                Text(descriptionString.localized(LocalizationService.shared.language))
                    .font(.system(size: 11))
                    .foregroundColor(.black)
                    .padding([.leading, .trailing], 8)
            }
        }
        .frame(width: 150, height: 100, alignment: .center)
        .background(
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(Color.clear, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 5).fill(Color.white)
                )
        )
    }
}

struct MiniCardTrainingHome_Previews: PreviewProvider {
    static var previews: some View {
        MiniCardTrainingHome(imageString: "ic_match_icon",
                             titleString: "Match",
                             descriptionString: "Get ready for the game, and try your best",
                             color: Color("greenSuperMedium"))
    }
}
