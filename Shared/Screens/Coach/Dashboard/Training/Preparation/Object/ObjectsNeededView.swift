//
//  ObjectsNeededView.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 23/4/22.
//

import SwiftUI

struct ObjectsNeededView: View {
    
    //MARK: - Presentation Propertiers
    @Environment(\.presentationMode) var presentation
    
    var objectsList = objectsData

    var body: some View {
        ZStack {
            VStack(spacing: 20){
                VStack(spacing: 10){
                    Text("objects_selection_title".localized(LocalizationService.shared.language))
                        .foregroundColor(.black)
                        .font(.system(size: 23))
                        .bold()
                    Text("objects_selection_subtitle".localized(LocalizationService.shared.language))
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(8)
                        .frame(width: UIScreen.main.bounds.width / 1.15, alignment: .leading)
                }
                ScrollView {
                    VStack {
                        ForEach(objectsList) { item in
                            ObjectCard(item: item)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.70, alignment: .top)
                // MARK: - Button
                Button(action: {
                    presentation.wrappedValue.dismiss()
                }) {
                    Text("button_save_details".localized(LocalizationService.shared.language))
                        .font(.system(size: 16))
                        .bold()
                }.buttonStyle(
                    MediumButtonStyle(textColor: Color.white, backgroundColor: Color("blueColor"))
                )
            }
            .padding([.leading, .trailing], 20)
        }
        .padding(.top, 50)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.1, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color("blueMediumColor"), Color("blueLightColor")]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
        .navigationBarTitle(Text("objects_needed_title".localized(LocalizationService.shared.language)), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
          leading: Button(action: { presentation.wrappedValue.dismiss() }) {
              Image("left_arrow")
                  .resizable()
                  .frame(width: 35, height: 35)
        })
    }
}

struct ObjectsNeededView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectsNeededView()
    }
}
