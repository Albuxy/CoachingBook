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

  @State var currentCoach: Coach

  var body: some View {
     VStack {
        switch self.userScreenEntry {
        case .contacts:
            ContactsListView(contacts: currentCoach.contacts)
        case .favourites:
            FavouritesContactsView(contacts: currentCoach.contacts)
        }
     }
  }
}

struct SwitchContactView_Previews: PreviewProvider {
    @State static var value: ContactEntries = .contacts
    static var previews: some View {
        SwitchContactView(userScreenEntry: $value, currentCoach: coachData)
    }
}
