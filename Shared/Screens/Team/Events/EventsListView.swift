//
//  EventsListView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 9/5/22.
//

import SwiftUI

struct EventsListView: View {

    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var eventsModel = EventsListModel()
    @State var team: Team

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
          VStack(alignment: .center, spacing: 0) {
              Rectangle()
                .foregroundColor(Color("blueColor"))
                .frame(height: 50, alignment: .top)
                .overlay(
                  CustomPickerEventBar(selection: eventsModel)
                )
            GeometryReader { _ in
                SwitchEventView(userScreenEntry: $eventsModel.showSection,
                                currentTeam: team)
              .frame(width: 380, alignment: .top)
              .padding([.leading, .trailing], 18)
            }
          }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle(Text("contacts_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
          })
    }
}

struct EventsListView_Previews: PreviewProvider {
    static var previews: some View {
        EventsListView(team: teamsData[0])
    }
}

struct CustomPickerEventBar: View {

  @StateObject var selection = EventsListModel()

  var body: some View {

    let item1 = SegmentEventItem(title: "trainings", selectionIndex: .trainings)
    let item2 = SegmentEventItem(title: "matchs", selectionIndex: .matchs)

    return VStack {
        SegmentEventControl(selection: selection, items: [item1, item2])
    }
  }
}
