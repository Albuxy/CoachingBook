//
//  CustomPickerContacts.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 3/5/22.
//

import Foundation
import SwiftUI

struct CustomPickerContactBar: View {

  @StateObject var selection = ContactsDetailModel()

  var body: some View {

    let item1 = SegmentItem(title: "Contacts", selectionIndex: .contacts)
    let item2 = SegmentItem(title: "Favourites", selectionIndex: .favourites)

    return VStack {
      SegmentControl(selection: selection, items: [item1, item2])
    }
  }
}

struct SegmentControl: View {

  @StateObject var selection = ContactsDetailModel()
  var items: [SegmentItem]

  var body: some View {

    return
      VStack {
        HStack(spacing: 0) {
          ForEach(items, id: \.self) { item in
            SegmentButton(
              text: item.title,
              selectionIndex: item.selectionIndex,
              selection: self.selection
            )
          }
        }
        .frame(width: 250, height: 30)
        .border(Color.white)
      }
  }
}

struct SegmentButton: View {

  var text: String
  var selectionIndex: ContactEntries

  @StateObject var selection = ContactsDetailModel()

  var body: some View {
    Button(action: {
      self.selection.showSection = self.selectionIndex
    }) {
      Text(LocalizedStringKey(text))
        .font(.system(size: 14))
        .frame(width: 126, height: 30, alignment: /*@START_MENU_TOKEN@*/ .center /*@END_MENU_TOKEN@*/)
    }
    .background(selection.showSection == self.selectionIndex ? Color.white : Color("blueColor"))
    .foregroundColor(selection.showSection == self.selectionIndex ? Color("blueColor") : Color.white)
  }
}

struct SegmentItem: Hashable {
  var title: String = ""
  var selectionIndex: ContactEntries
}

struct CustomPickerContactBar_Previews: PreviewProvider {
  static var previews: some View {
      CustomPickerContactBar()
  }
}
