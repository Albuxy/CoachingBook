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
  @ObservedObject var viewModel: ContactsDetailModel

  var body: some View {
     VStack {
        switch self.userScreenEntry {
        case .contacts:
            ContactsListView(contacts: viewModel)
        case .favourites:
            FavouritesContactsView(contacts: viewModel)
        }
     }
  }
}

struct SwitchContactView_Previews: PreviewProvider {
    @State static var value: ContactEntries = .contacts
    static var previews: some View {
        SwitchContactView(userScreenEntry: $value, viewModel: ContactsDetailModel())
    }
}
