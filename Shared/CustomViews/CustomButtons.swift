//
//  CustomButtons.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 20/4/22.
//

import Foundation
import SwiftUI

struct RemoveButton: View {

    var stringButton: String

    var body: some View {
        Button(action: {}) {
            HStack (spacing: 38){
                Image("ic_cancel_red")
                    .resizable()
                    .frame(width: 21, height: 21)
                Text(LocalizedStringKey(stringButton))
                    .font(.system(size: 16))
                    .bold()
                    .foregroundColor(.black)
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
}
