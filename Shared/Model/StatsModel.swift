//
//  StatsModel.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 8/5/22.
//

import Foundation

//Model for Attendance stats
struct AttendanceStats: Identifiable {
    var id = UUID()
    var percentatgeMatchTotal: Float
    var percentatgeTrainingTotal: Float
    var injuriesMatch: Int
    var injuriesTraining: Int
    var otherMatch: Int
    var otherTraining: Int
    var totalTraining = trainingData.count
    var totalMatch = matchData.count
}

//Model for Punctuality stats
struct PunctualityStats: Identifiable {
    var id = UUID()
    var percentatgeMatchTotal: Float
    var percentatgeTrainingTotal: Float
    var injuriesMatch: Int
    var injuriesTraining: Int
    var otherMatch: Int
    var otherTraining: Int
    var totalTraining = trainingData.count
    var totalMatch = matchData.count
}

//Model for Behaviour stats
struct BehaviourStats: Identifiable {
    var id = UUID()
    var percentatgeMatchTotal: Float
    var percentatgeTrainingTotal: Float
    var injuriesMatch: Int
    var injuriesTraining: Int
    var otherMatch: Int
    var otherTraining: Int
    var totalTraining = trainingData.count
    var totalMatch = matchData.count
}
