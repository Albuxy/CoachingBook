//
//  MatchInformationView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 18/5/22.
//

import SwiftUI
import MapKit

struct MatchInformationView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    var currentMatch: Match

    var body: some View {
        ZStack{
            VStack(spacing: 20){
                HeaderInfoMatch(currentMatch: currentMatch)
                InfoMatchReadyCard(currentMatch: currentMatch)
            }
            .padding(.top, 20)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
            .background(Color("secondLightBlueColor"))
        }
        .padding(.top, 40)
        .navigationBarTitle(Text("details_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
          })
    }
}

struct HeaderInfoMatch: View {
    
    var currentMatch: Match
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            HStack(spacing: 20){
                Image(currentMatch.imageTeam1)
                    .resizable()
                    .frame(width: 80, height: 80)
                VStack(spacing: 8){
                    Text(currentMatch.date)
                        .foregroundColor(Color("blueColor").opacity(0.6))
                        .font(.system(size: 16))
                    Text(currentMatch.hour)
                        .foregroundColor(Color("blueColor").opacity(0.6))
                        .font(.system(size: 16))
                }
                Image(currentMatch.imageTeam2)
                    .resizable()
                    .frame(width: 80, height: 80)
                
            }
            HStack(spacing: 140){
                Text(currentMatch.stringTeam1)
                    .foregroundColor(Color("blueColor"))
                    .bold()
                    .font(.system(size: 21))
                Text(currentMatch.stringTeam2)
                    .foregroundColor(Color("blueColor"))
                    .bold()
                    .font(.system(size: 21))
            }
        }
        .frame(width: 350, height: 150, alignment: .center)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .strokeBorder(Color.clear, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 15).fill(Color.white)
                )
                .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 2)
        )
    }
}

struct InfoMatchReadyCard: View {

    var currentMatch: Match

    var body: some View {
        VStack(spacing: 35){
            Text("match_title1".localized(LocalizationService.shared.language))
                .bold()
                .foregroundColor(Color("blueColor"))
                .font(.system(size: 21))
            +
            Text("infor_title".localized(LocalizationService.shared.language))
                .foregroundColor(Color("blueColor").opacity(0.8))
                .font(.system(size: 21))
            VStack(spacing: 20){
                ImageWithTitleLineView(title: "category_title",
                                       imageString: "ic_ball_basket")
                Text("Pre-Infantil Femenino - Grupo B")
                    .foregroundColor(Color("blueColor"))
                    .font(.system(size: 20))
                    .frame(width: UIScreen.main.bounds.width / 1.30, alignment: .leading)
                
            }
            VStack(spacing: 20){
                ImageWithTitleLineView(title: "adress_title",
                                       imageString: "ic_ubi")
                HStack(spacing: 15){
                    Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.395306, longitude: 2.105181), span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4))), interactionModes: [])
                        .frame(width: 140, height: 130)
                    Text("Calle Aribau 540\nBarcelona\n08034\nSpain")
                        .foregroundColor(Color("blueColor"))
                        .font(.system(size: 20))
                        .frame(width: 160, height: 130, alignment: .top)
                }.frame(width: UIScreen.main.bounds.width / 1.30, alignment: .leading)
            }
            VStack(spacing: 20){
                ImageWithTitleLineView(title: "referee_button_title",
                                       imageString: "ic_referee")
                VStack(spacing: 8){
                    Text(currentMatch.referee1)
                        .foregroundColor(Color("blueColor"))
                        .font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width / 1.30, alignment: .leading)
                    Text(currentMatch.referee2)
                        .foregroundColor(Color("blueColor"))
                        .font(.system(size: 20))
                        .frame(width: UIScreen.main.bounds.width / 1.30, alignment: .leading)
                }
            }
        }
        .padding(.top, 30)
        .frame(width: 420, height: 670, alignment: .top)
        .background(
            RoundedRectangle(cornerRadius: 60)
                .strokeBorder(Color.clear, lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 60).fill(Color.white)
                )
        )
    }
}

struct ImageWithTitleLineView: View {

    var title: String
    var imageString: String

    var body: some View {
        VStack {
            HStack(spacing: 15){
                Image(imageString)
                    .resizable()
                    .frame(width: 30, height: 30)
                Text(title.localized(LocalizationService.shared.language))
                    .foregroundColor(Color("blueColor"))
                    .font(.system(size: 19))
                    .bold()
                    .frame(width: UIScreen.main.bounds.width / 1.30, alignment: .leading)
            }
            .padding(.leading, 50)
            Divider()
                .frame(width: UIScreen.main.bounds.width / 1.30)
                .background(Color.black)
        }
    }
}

struct MatchInformationView_Previews: PreviewProvider {
    static var previews: some View {
        MatchInformationView(currentMatch: matchData[0])
    }
}
