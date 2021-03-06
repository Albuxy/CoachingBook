//
//  MatchEventListView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 9/5/22.
//

import SwiftUI

struct MatchEventListView: View {
    
    @ObservedObject var matchModel: MatchListModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 15){
                ForEach(matchModel.matchList) { item in
                    EventMatchCard(match: item, matchModel: matchModel)
                }
            }
            .padding(.top, 20)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
        }
    }
}

struct MatchEventListView_Previews: PreviewProvider {
    static var previews: some View {
        MatchEventListView(matchModel: MatchListModel())
    }
}
