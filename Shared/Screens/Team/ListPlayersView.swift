//
//  ListPlayersView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 6/5/22.
//

import SwiftUI

struct ListPlayersView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    @State var navigateToAddPlayer = false
    
    var listOfPlayers: [Player]
    
    var body: some View {
        ZStack{
            VStack(spacing: 20){
                Text("players_title".localized(LocalizationService.shared.language) + "\(listOfPlayers.count)")
                    .foregroundColor(.black)
                    .font(.system(size: 24))
                    .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                
                ScrollView {
                    VStack(spacing: 20){
                        ForEach(listOfPlayers) { player in
                            CardPlayerListView(currentPlayer: player)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width / 1.1)
                }
            }
            .padding(.top, 50)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
            .background(Color("fourthLightBlueColor"))
        }
        .navigationBarTitle(Text("list_of_players_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
          }, trailing:
            NavigationLink(
              destination: AddPlayerView(),
              isActive: $navigateToAddPlayer,
              label: {
                  Button(action: {
                      navigateToAddPlayer.toggle()
                  }) {
                    Image(systemName: "person.fill.badge.plus")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.black)
                }
              }
            )
        )
    }
}

struct CardPlayerListView: View {
    
    var currentPlayer: Player
    
    @State var navigateToPlayerInformation = false
    
    var body: some View {
        NavigationLink(
          destination: PlayerInformationView(player: currentPlayer),
          isActive: $navigateToPlayerInformation,
          label: {
              Button {
                  navigateToPlayerInformation.toggle()
              } label: {
                  HStack(alignment: .top, spacing: 20){
                      Text("\(currentPlayer.dorsal)")
                          .foregroundColor(Color("blueColor"))
                          .font(.system(size: 26))
                          .bold()
                          .padding(.leading, 10)
                      VStack(alignment: .leading, spacing: 10){
                          Text(currentPlayer.name + " " + currentPlayer.surname)
                              .foregroundColor(.black)
                              .font(.system(size: 23))
                          HStack {
                              Text("position_title".localized(LocalizationService.shared.language))
                                  .foregroundColor(.black)
                                  .font(.system(size: 17))
                              Text(currentPlayer.getStringForPosition(currentPosition: currentPlayer.position))
                                  .bold()
                                  .padding([.leading, .trailing], 20)
                                  .padding([.top, .bottom], 3)
                                  .foregroundColor(.white)
                                  .font(.system(size: 17))
                                  .background(
                                      RoundedRectangle(cornerRadius: 20)
                                          .strokeBorder(Color.clear, lineWidth: 1)
                                          .background(
                                              RoundedRectangle(cornerRadius: 20).fill(currentPlayer.getColorForPosition(currentPosition: currentPlayer.position))
                                          )
                                  )
                          }
                      }
                      
                  }
                  .padding()
                  .frame(width: 350, height: 100, alignment: .leading)
                  .background(
                      RoundedRectangle(cornerRadius: 20)
                          .strokeBorder(Color.gray, lineWidth: 1)
                          .background(
                              RoundedRectangle(cornerRadius: 20).fill(Color.white)
                          )
                          .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                  )
              }
          })
    }
}

struct ListPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        ListPlayersView(listOfPlayers: playersData)
    }
}
