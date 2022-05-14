//
//  TotalRankingView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 15/5/22.
//

import SwiftUI

struct TotalRankingView: View {
    var body: some View {
        VStack{
            Image("ic_podium")
                .resizable()
                .frame(width: 300, height: 200)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(Color.clear, lineWidth: 1)
                        .background(
                            RoundedRectangle(cornerRadius: 20).fill(Color.gray)
                        )
                )
        }
        
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
         .background(Color("fourthLightBlueColor"))
    }
}

struct TotalRankingView_Previews: PreviewProvider {
    static var previews: some View {
        TotalRankingView()
    }
}
