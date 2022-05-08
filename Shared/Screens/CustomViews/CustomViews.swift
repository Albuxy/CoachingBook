//
//  CustomViews.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 10/4/22.
//

import Foundation
import SwiftUI

struct TextFieldGeneral: View {

    var defaultTextFiled: String
    @Binding var stringTextField: String

    var body: some View {
        TextField("", text: $stringTextField)
            .foregroundColor(.black)
            .placeholder(Text(defaultTextFiled.localized(LocalizationService.shared.language))
                        .foregroundColor(.gray), show: stringTextField.isEmpty)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color("lightGrayColor"), style: StrokeStyle(lineWidth: 1.0)))
            .padding()
            .overlay(
                HStack {
                    if !self.stringTextField.isEmpty {
                        Spacer()
                        Button(action: {}) {
                            Image("ic_cancel")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .onTapGesture {
                                    self.stringTextField = ""
                                }
                        }
                        .padding()
                        .padding(.trailing, 10)
                    }
                }
            )
            .frame(width: 350, height: 50, alignment: .leading)
    }
}

struct SecureFieldGeneral: View {

    var defaultTextFiled: String
    @Binding var stringTextField: String

    var body: some View {
        SecureField(defaultTextFiled.localized(LocalizationService.shared.language), text: $stringTextField)
            .foregroundColor(.black)
            .placeholder(Text(defaultTextFiled.localized(LocalizationService.shared.language))
                    .foregroundColor(.gray), show: stringTextField.isEmpty)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color("lightGrayColor"), lineWidth: 1)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                    )
            )
            .padding()
            .overlay(
                HStack {
                    if !self.stringTextField.isEmpty {
                        Spacer()
                        Button(action: {}) {
                            Image("ic_cancel")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .onTapGesture {
                                    self.stringTextField = ""
                                }
                        }
                        .padding()
                        .padding(.trailing, 10)
                    }
                }
            )
            .frame(width: 350, height: 50, alignment: .leading)
    }
}

struct RadioButtonWithName: View {

    var title: String
    var color: Color
    var booleanToChange: Bool
    let callback: (String)->()

    var body: some View {
        Button(action:{
            self.callback(self.title.localized(LocalizationService.shared.language))
        }) {
            HStack(alignment: .center) {
                Text(title.localized(LocalizationService.shared.language))
                    .foregroundColor(.black)
                    .font(Font.system(size: 20))
                Spacer()
                Image(systemName: self.booleanToChange ? "largecircle.fill.circle" : "circle")
                    .resizable()
                    .frame(width: 21, height: 21)
                    .clipShape(Circle())
                    .foregroundColor(color)
            }
        }
    }
}
