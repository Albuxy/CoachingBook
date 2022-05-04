//
//  EntriesMatchView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 1/5/22.
//

import SwiftUI

struct EntriesMatchView: View {

    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    var match: Match
    @State var isSelected = false
    var currentItem = 0
    
    var body: some View {
        VStack(spacing: 40){
            VStack(spacing: 20){
                Text("match_entries_title")
                    .font(.system(size: 24))
                    .bold()
                Text("match_entries_subtitle")
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
            }
            ScrollView {
                GridStack(rows: match.playersAssisting.count, columns: match.numberOfPeriods, playersList: match.playersAssisting) { row, col in
                    RowColumnView(isChecked: isSelected)
                }
                .padding([.leading, .trailing], 20)
            }
            .frame(height: 530, alignment: .center)
            // MARK: - Button
            Button(action: {
                presentation.wrappedValue.dismiss()
            }) {
                Text("button_save_details")
                    .font(.system(size: 16))
                    .bold()
            }.buttonStyle(
                MediumButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
            )
        }
        .padding(.top, 40)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color("greenMediumColor"), Color("greenLightColor")]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing))
        .navigationBarTitle(Text("match_entries_title"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
}

struct GridStack<Content: View>: View {
    var playersList: [Player]
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack(spacing: 0){
            ForEach(0 ..< rows, id: \.self) { row in
                HStack(spacing: 10){
                    Text(playersList[row].name)
                        .font(.system(size: 20))
                    HStack(spacing: -2){
                        ForEach(0 ..< columns, id: \.self) { column in
                            content(row, column)
                        }
                    }
                }
            }
        }
    }

    init(rows: Int, columns: Int, playersList: [Player], @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.playersList = playersList
        self.content = content
    }
}

struct RowColumnView: View {
    @State var isChecked:Bool = false
    func toggle(){isChecked = !isChecked}


    var body: some View {
        Image(systemName: isChecked ? "clear.fill" : "square")
            .resizable()
            .frame(width: 45, height: 55)
            .foregroundColor(isChecked ? Color("blueColor") : Color.secondary)
            .onTapGesture {
                toggle()
            }
    }
}

struct EntriesMatchView_Previews: PreviewProvider {
    static var previews: some View {
        EntriesMatchView(match: matchData[0])
    }
}
