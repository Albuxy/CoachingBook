//
//  ObjectCard.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 23/4/22.
//

import SwiftUI

struct ObjectCard: View {
    
    var item: Object
    @State var number_selected = "0"
    @State var isSelected = false

    var body: some View {
        VStack {
            HStack(spacing: 15){
                Image(item.imageObject)
                    .resizable()
                    .frame(width: 41, height: 41)
                Text(item.titleObject.localized(LocalizationService.shared.language))
                Spacer()
                Button {
                    isSelected.toggle()
                } label: {
                    Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                        .resizable()
                        .frame(width: 21, height: 21)
                        .clipShape(Circle())
                        .foregroundColor(Color("blueColor"))
                }
            }
            .padding()
            if isSelected {
                VStack{
                    Text("objects_select_numer".localized(LocalizationService.shared.language))
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                    TextField("0", text: $number_selected)
                        .multilineTextAlignment(.center)
                        .frame(width: 30, height: 30)
                        .keyboardType(.numberPad)
                        .overlay(RoundedRectangle(cornerRadius: 8.0).strokeBorder(Color("lightGrayColor"), style: StrokeStyle(lineWidth: 1.0)))
                }
            }
        }
        .frame(width: 300, height: isSelected ? 150 : 75, alignment: .topLeading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color("blueColor"), lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 10).fill(Color.white)
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
        )
    }
}

struct ObjectCard_Previews: PreviewProvider {
    static var previews: some View {
        ObjectCard(item: objectsData[1])
    }
}
