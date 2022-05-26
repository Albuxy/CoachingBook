//
//  GiveBehaviourView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 25/5/22.
//

import SwiftUI

struct GiveBehaviourView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    @State var number = ""

    var body: some View {
        ZStack{
            GeometryReader { _ in
                VStack(spacing: 40){
                    VStack(spacing: 20){
                        Text("behaviour_give_title"
                                .localized(LocalizationService.shared.language))
                            .font(.system(size: 26))
                            .foregroundColor(.black)
                            .bold()
                        Text("behaviour_give_subtitle"
                                .localized(LocalizationService.shared.language))
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .lineSpacing(8)
                        Text("12/09/2005")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    .padding([.leading, .trailing], 20)
                    VStack(spacing: 30){
                        ForEach(playersData) { item in
                            RowForPlayerBehaviour(fullName: item.name + "  " + item.surname)
                        }
                    }
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }) {
                        Text("button_save_details".localized(LocalizationService.shared.language))
                            .font(.system(size: 16))
                            .bold()
                    }.buttonStyle(
                        MediumButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                    ).padding(.top, 20)
                }
                .padding(.top, 30)
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height,
                       alignment: .top)
                .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "E5EEFF"), Color.init(hex: "F7FAD4")]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing))
                
            }
        }
        .navigationBarTitle(Text("behaviour_title_low".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
}

struct RowForPlayerBehaviour: View {
    var fullName: String
    @State var number_selected = "0"

    var body: some View {
        HStack{
            Text(fullName)
                .font(.system(size: 21))
                .foregroundColor(.black)
            Spacer()
            TextField("0", text: $number_selected)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .frame(width: 50, height: 30)
                .overlay(RoundedRectangle(cornerRadius: 8.0).strokeBorder(Color("lightGrayColor"), style: StrokeStyle(lineWidth: 1.0)))
                .keyboardType(.numbersAndPunctuation)
        }
        .padding([.leading, .trailing], 40)
    }
}

extension  UITextField {
   @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
      self.resignFirstResponder()
   }
}

struct GiveBehaviourCard_Previews: PreviewProvider {
    static var previews: some View {
        GiveBehaviourView()
    }
}
