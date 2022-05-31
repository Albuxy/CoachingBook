//
//  CustomDayCalendarView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 31/5/22.
//

import SwiftUI

struct CustomDayCalendarView: View {
    
    var value: DateValue
    
    var body: some View {
        VStack{
            if value.day != -1 {
                if let matchs = matchCalendar.first(where: { match in
                    return isSameDay(date1: match.matchDate, date2: value.date)
                }){
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(Color.white)
                    Spacer()
                    Circle()
                        .fill(Color("redColor"))
                        .frame(width: 8, height: 8)
                    
                }
                else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
            }
        }
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}

struct CustomDayCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDayCalendarView(value: DateValue(day: 3, date: Date()))
    }
}
