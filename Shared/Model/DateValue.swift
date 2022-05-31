//
//  DateValue.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 30/5/22.
//

import Foundation

struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}

struct MatchMetaData: Identifiable {
    var id = UUID().uuidString
    var match: [Match]
    var matchDate: Date
    
}

func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

var matchCalendar: [MatchMetaData] = [
    MatchMetaData(match: [matchData[0], matchData[1], matchData[2]],
                  matchDate: getSampleDate(offset: -5)),
    MatchMetaData(match: [matchData[3]],
                  matchDate: getSampleDate(offset: -3)),
    MatchMetaData(match: [matchData[4], matchData[1]],
                  matchDate: getSampleDate(offset: -8)),
]
