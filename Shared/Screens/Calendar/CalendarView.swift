//
//  CalendarView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 30/5/22.
//

import SwiftUI

struct CalendarView: View {
    
    @State var currentDate: Date = Date()
    @ObservedObject var matchModel: MatchListModel
    
    var body: some View {
        VStack(spacing: 20){
            //Custom Day Picker
            CustomCalendarPicker(currentDate: $currentDate, matchModel: matchModel)
        }
        .padding(.top, 90)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(matchModel: MatchListModel())
    }
}
