//
//  ListEventsCalendarView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 31/5/22.
//

import SwiftUI

struct ListEventsCalendarView: View {
    
    @Binding var currentDate: Date
    
    var body: some View {
        VStack(spacing: 20){
            Text("Events for today")
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
            if let matchs = matchCalendar.first(where: { match in
                return isSameDay(date1: match.matchDate, date2: currentDate)
            }){
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(matchs.match){ match in
                        VStack(alignment: .leading, spacing: 10){
                            EventMatchCard(match: match)
                        }
                        .padding(.leading, 10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            else {
                Text("No Events Found")
                    .padding(.top, 20)
            }
        }
    }

    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}

struct ListEventsCalendarView_Previews: PreviewProvider {
    @State static var value = Date()

    static var previews: some View {
        ListEventsCalendarView(currentDate: $value)
    }
}
