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
    var body: some View {
        VStack{
            VStack(spacing: 15){
                // Days
                let days: [String] = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
                
                HStack{
                    HStack(spacing: 10) {
                        Text(extraDate()[1])
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Text(extraDate()[0])
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    HStack(spacing: 30){
                        Button {
                            withAnimation {
                                currentMonth -= 1
                            }
                        } label: {
                            Image(systemName: "chevron.left")
                                .resizable()
                                .frame(width: 10, height: 20)
                                .font(.title)
                                .foregroundColor(.white)
                                .background(
                                    Circle()
                                        .fill(Color("baseColor"))
                                        .frame(width: 30, height: 30)
                                )
                        }
                        Button {
                            withAnimation {
                                currentMonth += 1
                            }
                        } label: {
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 10, height: 20)
                                .font(.title)
                                .foregroundColor(.white)
                                .background(
                                    Circle()
                                        .fill(Color("baseColor"))
                                        .frame(width: 30, height: 30)
                                )
                        }
                        
                    }
                }
                .padding([.top, .trailing], 20)
                // Day View
                
                HStack(spacing: 0){
                    ForEach(days, id: \.self) { day in
                        Text(day)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                    }
                }
                
                // Dates
                // Lazy Grid..
                let columns = Array(repeating: GridItem(.flexible()), count: 7)
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(extractDate()) { value in
                        CardView(value: value)
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
            .padding([.leading, .trailing], 20)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View {
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
        .padding(.vertical, 8)
        .frame(height: 30, alignment: .top)
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
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

struct CustomCalendarPicker_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

extension Date {

    func getAllDates() -> [Date] {
        let calendar = Calendar.current
        
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
