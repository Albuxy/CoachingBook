//
//  SwitchEventView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 9/5/22.
//

import Foundation
import SwiftUI

class EventsListModel: ObservableObject {
  @Published var showSection: EventEntries = .trainings
}

enum EventEntries {
  case trainings, matchs
}

struct SwitchEventView: View {

  @Binding var userScreenEntry: EventEntries
  var currentTeam: Team

  var body: some View {
     VStack {
        switch self.userScreenEntry {
        case .trainings:
            TrainingEventListView(trainingList: currentTeam.trainingEvents)
        case .matchs:
            EmptyView()
        }
     }
  }
}
