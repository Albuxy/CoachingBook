//
//  SwitchContactView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 3/5/22.
//

import SwiftUI

enum ContactEntries {
  case contacts, favourites
}

struct SwitchContactView: View {

  @Binding var userScreenEntry: ContactEntries

  @Binding var currentCoach: Coach

  var body: some View {
     VStack {
        switch self.userScreenEntry {
        case .contacts:
            ContactsListView(coach: $currentCoach)
        case .favourites:
            FavouritesContactsView(coach: $currentCoach)
        }
     }
  }
}


struct SwitchContactView_Previews: PreviewProvider {
    @State static var value: ContactEntries = .contacts
    @State static var value2 = coachData
    static var previews: some View {
        SwitchContactView(userScreenEntry: $value, currentCoach: $value2)
    }
}
