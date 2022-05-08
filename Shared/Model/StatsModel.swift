//
//  StatsModel.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 8/5/22.
//

import Foundation

//Model for Stats
struct Stats: Identifiable {
    var id = UUID()
    var attendMatchPercentage: Int
    var attendTrainingPercentage: Int
    var punctualityMatchPercentage: Int
    var punctualityTrainingPercentage: Int
    var behaviourMatchPercentage: Int
    var behaviourTrainingPercentage: Int
}
