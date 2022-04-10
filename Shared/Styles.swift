//
//  Styles.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 10/4/22.
//

import Foundation
import SwiftUI

struct ButtonGeneralStyle: ButtonStyle {
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
