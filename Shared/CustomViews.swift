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
        TextField(LocalizedStringKey(defaultTextFiled), text: $stringTextField)
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
                    }
                }
            )
            .frame(width: 350, height: 50, alignment: .leading)
    }
}

struct SecureFieldGeneral: View {

    var defaultTextFiled: LocalizedStringKey
    @Binding var stringTextField: String

    var body: some View {
        SecureField(defaultTextFiled, text: $stringTextField)
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
                    }
                }
            )
            .frame(width: 350, height: 50, alignment: .leading)
    }
}

struct RemoveButton: View {

    var stringButton: String

    var body: some View {
        Button(action: {}) {
            HStack (spacing: 38){
                Image("ic_cancel_red")
                    .resizable()
                    .frame(width: 21, height: 21)
                Text(LocalizedStringKey(stringButton))
                    .font(.system(size: 16))
                    .bold()
                    .foregroundColor(.black)
            }
            .padding(.leading, 25)
            .frame(width: UIScreen.main.bounds.width / 1.35, height: 30, alignment: .leading)
        }
        .padding(5)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color("redColor"), lineWidth: 3)
                .background(
                    RoundedRectangle(cornerRadius: 8).fill(Color("redColor").opacity(0.22))
                )
        )
    }
}

