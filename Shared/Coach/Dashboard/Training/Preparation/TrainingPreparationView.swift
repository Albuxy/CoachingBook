//
//  TrainingPreparationView.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 22/4/22.
//

import SwiftUI

struct TrainingPreparationView: View {

    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation

    var currentTraining: Training

    @State var selectedOptionIndoorOutdoor = ""
    @State var importanceLevel = ""

    @State var navigateToObjectsNeeded = false
    @State var navigateToAssistantePlayers = false
    @State var navigateToNonAssistantePlayers = false
    @State var navigateToCancelSession = false

    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .center, spacing: 30) {
                ZStack(alignment: .top) {
                    Rectangle()
                        .foregroundColor(Color("secondBlueColor"))
                        .frame(width: UIScreen.main.bounds.width,
                               height: 140)
                    TrainingSessionHeaderCard(trainingSession: currentTraining)
                        .padding(.top, 40)
                }
                ScrollView {
                    VStack(spacing: 40) {
                        VStack(spacing: 20){
                            TrainingTitleWithLineView(title: "training_information_title")
                            NavigationLink(
                            destination: ObjectsNeededView(),
                              isActive: $navigateToObjectsNeeded,
                              label: {
                                  ButtonWithArrow(nameButton: "objects_needed_title", booleanToChange: $navigateToObjectsNeeded)
                              }
                            )
                            DropDownViewDown(title: "Indoor_Outdoor_title", value: $selectedOptionIndoorOutdoor)
                            DropDownViewLeft(title: "importance_level_title", value: $importanceLevel)
                        }
                        VStack(spacing: 20){
                            TrainingTitleWithLineView(title: "training_players_information")
                            NavigationLink(
                              destination: AssistantPlayersView(playersList: currentTraining.playersAssisting),
                              isActive: $navigateToAssistantePlayers,
                              label: {
                                  ButtonWithArrow(nameButton: "assistant_players_title", booleanToChange: $navigateToAssistantePlayers)
                              }
                            )
                            NavigationLink(
                              destination: NonAssistantPlayersView(playersList: playersNotAssistData),
                              isActive: $navigateToNonAssistantePlayers,
                              label: {
                                  ButtonWithArrow(nameButton: "non_assistant_players_title", booleanToChange: $navigateToNonAssistantePlayers)
                              }
                            )
                        }
                        VStack(spacing: 20){
                            TrainingTitleWithLineView(title: "actions_title")
                            NavigationLink(
                            destination: CancelTrainningView(),
                              isActive: $navigateToCancelSession,
                              label: {
                                  ButtonWithArrow(nameButton: "cancel_session_title", booleanToChange: $navigateToCancelSession)
                              }
                            )
                        }
                    }
                }
                .frame(height: 510)
                RemoveButton(stringButton: "button_remove_session")
            }
        }
        .padding(.top, 60)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
        .navigationBarTitle(Text("training_preparation"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
}

struct TrainingTitleWithLineView: View {

    var title: String

    var body: some View {
        VStack {
            Text(LocalizedStringKey(title))
                .font(.system(size: 19))
                .bold()
                .frame(width: UIScreen.main.bounds.width / 1.30, alignment: .leading)
            Divider()
                .frame(width: UIScreen.main.bounds.width / 1.30)
                .background(Color.black)
        }
    }
}

struct ButtonWithArrow: View {

    var nameButton: String
    @Binding var booleanToChange: Bool

    var body: some View {
        Button(action: {
            booleanToChange.toggle()
        }) {
            HStack(){
                Text(LocalizedStringKey(nameButton))
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                Spacer()
                Image("ic_arrow_right")
                    .resizable()
                    .frame(width: 18, height: 18)
            }
            .frame(width: 320)
        }
    }
}

struct TextWithCounter: View {
    
    var title: String
    var number: Int

    var body: some View {
        HStack{
            Text(LocalizedStringKey(title))                           .font(.system(size: 18))
                .foregroundColor(.black)
            Spacer()
            Text("\(number)")
                .bold()
                .padding([.leading, .trailing], 12)
                .padding([.top, .bottom], 6)
                .overlay(RoundedRectangle(cornerRadius: 8.0).strokeBorder(Color("lightGrayColor"), style: StrokeStyle(lineWidth: 1.0)))
        }
        .frame(width: UIScreen.main.bounds.width / 1.30, alignment: .leading)
    }
}

struct DropDownView: View {

    @Binding var value: String
    var placeholder: String
    var dropDownList: [String]

    var body: some View {
        Menu {
            ForEach(dropDownList, id: \.self){ client in
                Button(client) {
                    self.value = client
                }
            }
        } label: {
            VStack(spacing: 5){
                HStack{
                    Text(value.isEmpty ? placeholder : value)
                        .foregroundColor(value.isEmpty ? .gray : .black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundColor(Color.black)
                        .font(Font.system(size: 18))
                        .padding(.trailing, -10)
                }
                .padding(.horizontal)
            }
            .padding(8)
            .overlay(RoundedRectangle(cornerRadius: 6.0).strokeBorder(Color("lightGrayColor"), style: StrokeStyle(lineWidth: 1.0)))
        }
    }
}

struct DropDownViewDown: View {

    var title: String
    @Binding var value: String

    var body: some View {
        VStack(spacing: 10){
            Text(LocalizedStringKey(title))
                .font(.system(size: 18))
                .foregroundColor(.black)
                .frame(width: 320, alignment: .leading)
            DropDownView(value: $value,
                         placeholder: "Choose",
                         dropDownList: ["Indoor", "Outdoor"])
                .frame(width: UIScreen.main.bounds.width / 1.30, height: 40)
        }
    }
}

struct DropDownViewLeft: View {

    var title: String
    @Binding var value: String

    var body: some View {
        HStack(spacing: 0){
            Text(LocalizedStringKey(title))
                .font(.system(size: 18))
                .foregroundColor(.black)
            Spacer()
            DropDownView(value: $value,
                         placeholder: "None",
                         dropDownList: ["Low", "Medium", "High"])
                .frame(width: 140, height: 40)
        }
        .frame(width: UIScreen.main.bounds.width / 1.3, height: 40)
        
    }
}
        
struct TrainingPreparationView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingPreparationView(currentTraining: trainingData[0])
    }
}
