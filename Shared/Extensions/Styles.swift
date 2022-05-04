//
//  Styles.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 10/4/22.
//

import Foundation
import SwiftUI

struct SmallButtonStyle: ButtonStyle {
    var textColor: Color
    var backgroundColor: Color
    var disabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(textColor)
            .padding()
            .frame(width: 200, height: 50)
            .background(backgroundColor)
            .cornerRadius(12.0)
            .disabled(disabled)
    }
}

struct MediumButtonStyle: ButtonStyle {
    var textColor: Color
    var backgroundColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(textColor)
            .padding()
            .frame(width: UIScreen.main.bounds.width / 1.25, height: 40)
            .background(backgroundColor)
            .cornerRadius(8.0)
            .disabled(false)
    }
}

struct SuperSmallButtonStyle: ButtonStyle {
    var textColor: Color
    var backgroundColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(textColor)
            .padding()
            .frame(width: 100, height: 26)
            .background(backgroundColor)
            .cornerRadius(8.0)
            .disabled(false)
    }
}
