//
//  TrainingInformationView.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 18/5/22.
//

import SwiftUI

struct TrainingInformationView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    var currentTraining: Training
    
    var body: some View {
        ZStack{
            VStack(spacing: 20){
                HeaderInfoTraining(currentTraining: currentTraining)
                InfoTrainingReadyCard(currentTraining: currentTraining)
            }
            .padding(.top, 20)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
        }
        .background(Color("greenSuperLight"))
        .padding(.top, 40)
        .navigationBarTitle(Text("training_information_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
          })
    }
}

struct HeaderInfoTraining: View {
    
    var currentTraining: Training
    
    var body: some View {
        HStack(alignment: .center, spacing: 30){
            Image("ic_trainning_icon")
                .resizable()
                .frame(width: 80, height: 80)
            VStack(alignment: .leading, spacing: 10){
                Text(currentTraining.title)
                    .foregroundColor(.black)
                    .font(.system(size: 21))
                Text(currentTraining.date)
                    .foregroundColor(.gray)
                    .font(.system(size: 18))
                HStack(spacing: 8){
                    Text("status_subtitle".localized(LocalizationService.shared.language))
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                    Text(currentTraining.getStringOfStatus(currentStatus: currentTraining.statusPreparation))
                        .padding([.leading, .trailing], 10)
                        .padding([.top, .bottom], 3)
                        .foregroundColor(currentTraining.getColorOfStatus(currentStatus: currentTraining.statusPreparation))
                        .font(.system(size: 16))
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(Color.clear, lineWidth: 1)
                                .background(
                                    RoundedRectangle(cornerRadius: 20).fill(currentTraining.getColorOfStatus(currentStatus: currentTraining.statusPreparation).opacity(0.2))
                                )
                        )
                }
            }
        }
        .padding(.leading, 30)
        .frame(width: 350, height: 150, alignment: .leading)
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

struct InfoTrainingReadyCard: View {

    var currentTraining: Training
    @State var navigateToCancelSession = false

    var body: some View {
        VStack(spacing: 35){
            Text("train_title".localized(LocalizationService.shared.language))
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
                Text("Mini mascculino")
                    .foregroundColor(Color("blueColor"))
                    .font(.system(size: 20))
                    .frame(width: UIScreen.main.bounds.width / 1.30, alignment: .leading)
                
            }
            VStack(spacing: 20){
                ImageWithTitleLineView(title: "info_button_title",
                                       imageString: "ic_information_icon")
                Text("Playground - Outdoor")
                    .foregroundColor(Color("blueColor"))
                    .font(.system(size: 20))
                    .frame(width: UIScreen.main.bounds.width / 1.30, alignment: .leading)
            }
            VStack(spacing: 20){
                ImageWithTitleLineView(title: "team_players_title",
                                       imageString: "ic_referee")
                HStack{
                    Text("Players:")
                        .foregroundColor(Color("blueColor"))
                        .font(.system(size: 20))
                    Text("9")
                        .foregroundColor(Color("blueColor"))
                        .bold()
                        .font(.system(size: 20))
                }
                .frame(width: UIScreen.main.bounds.width / 1.30, alignment: .leading)
            }
            VStack(spacing: 20){
                ImageWithTitleLineView(title: "actions_title",
                                       imageString: "ic_action")
                NavigationLink(
                destination: CancelTrainningView(),
                  isActive: $navigateToCancelSession,
                  label: {
                      ButtonWithArrowBlue(nameButton: "cancel_session_title", booleanToChange: $navigateToCancelSession)
                  }
                )
                .frame(width: UIScreen.main.bounds.width / 1.30, alignment: .leading)
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

struct ButtonWithArrowBlue: View {

    var nameButton: String
    @Binding var booleanToChange: Bool

    var body: some View {
        Button(action: {
            booleanToChange.toggle()
        }) {
            HStack(){
                Text(nameButton.localized(LocalizationService.shared.language))
                    .font(.system(size: 18))
                    .foregroundColor(Color("blueColor"))
                Spacer()
                Image("ic_arrow_right")
                    .resizable()
                    .frame(width: 18, height: 18)
            }
            .frame(width: 320)
        }
    }
}

struct TrainingInformationView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingInformationView(currentTraining: trainingData[0])
    }
}
