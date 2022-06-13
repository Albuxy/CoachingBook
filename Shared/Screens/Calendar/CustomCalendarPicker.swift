//
//  CustomCalendarPicker.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 30/5/22.
//

import SwiftUI

struct CustomCalendarPicker: View {

    @Binding var currentDate: Date
    @State var currentMonth: Int = 0
    @ObservedObject var matchModel: MatchListModel

    var body: some View {
        VStack(spacing: 0){
            VStack(spacing: 15){
                let columns = Array(repeating: GridItem(.flexible()), count: 7)

                CalendarHeaderView(currentMonth: $currentMonth, currentDate: $currentDate)
                    .padding([.top, .trailing], 20)
                DayPicker()
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(extractDate()) { value in
                        CustomDayCalendarView(value: value)
                            .padding(.vertical, 8)
                            .frame(height: 30, alignment: .top)
                            .background(
                                Capsule()
                                    .fill(Color("baseColor"))
                                    .padding(.top, 8)
                                    .frame(width: 40, height: 40)
                                    .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                            )
                            .onTapGesture {
                                currentDate = value.date
                            }
                    }
                }
            }
            .padding(.top, 5)
            .padding([.leading, .trailing], 20)
            .padding(.bottom, 40)
            .background(Color("blueColor"))
            .onChange(of: currentMonth) { newValue in
                currentDate = getCurrentMonth()
            }
            ListEventsCalendarView(currentDate: $currentDate, matchModel: matchModel)
                .padding([.leading, .trailing, .top], 20)
                .frame(width: UIScreen.main.bounds.width, height: 470, alignment: .top)
                .background(Color("secondLightBlueColor"))
            
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current

        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        
        return currentMonth
    }
    
    func extractDate() -> [DateValue] {
        let calendar = Calendar.current

        let currentMonth = getCurrentMonth()

        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        
        let firstWeekDay = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekDay - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
}

struct DayPicker: View {

    let days: [String] = ["calendar_monday",
                          "calendar_tuesday",
                          "calendar_wednesday",
                          "calendar_thursday",
                          "calendar_friday",
                          "calendar_saturday",
                          "calendar_sunday"]

    var body: some View {
        HStack(spacing: 0){
            ForEach(days, id: \.self) { day in
                Text(day.localized(LocalizationService.shared.language))
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
            }
        }
    }
}

struct CustomCalendarPicker_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(matchModel: MatchListModel())
    }
}
