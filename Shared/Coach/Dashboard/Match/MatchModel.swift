//
//  MatchMode.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 22/4/22.
//

import Foundation
import SwiftUI

//Model for Trainings
struct Match: Identifiable {
    var id = UUID()
    var title: String
    var date: String
    var imageSession = "Match_session"
}
