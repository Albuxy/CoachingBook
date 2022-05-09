//
//  EventPicker.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 9/5/22.
//

import Foundation
import SwiftUI

struct SegmentEventControl: View {

  @StateObject var selection = EventsListModel()
  var items: [SegmentEventItem]

  var body: some View {

    return
      VStack {
        HStack(spacing: 0) {
          ForEach(items, id: \.self) { item in
              SegmentEventButton(
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

struct SegmentEventButton: View {

  var text: String
  var selectionIndex: EventEntries

  @StateObject var selection = EventsListModel()

  var body: some View {
    Button(action: {
      self.selection.showSection = self.selectionIndex
    }) {
      Text(text.localized(LocalizationService.shared.language))
        .font(.system(size: 14))
        .frame(width: 126, height: 30, alignment: /*@START_MENU_TOKEN@*/ .center /*@END_MENU_TOKEN@*/)
    }
    .background(selection.showSection == self.selectionIndex ? Color.white : Color("blueColor"))
    .foregroundColor(selection.showSection == self.selectionIndex ? Color("blueColor") : Color.white)
  }
}

struct SegmentEventItem: Hashable {
  var title: String = ""
  var selectionIndex: EventEntries
}
