//
//  CheckBoxView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 26/4/22.
//

import SwiftUI

struct CheckBoxView: View {
    @State var isChecked:Bool = false
    func toggle(){isChecked = !isChecked}

    var body: some View {
        Image(systemName: isChecked ? "checkmark.square.fill" : "square")
            .resizable()
            .frame(width: 28, height: 28)
            .foregroundColor(isChecked ? Color("blueColor") : Color.secondary)
            .onTapGesture {
                toggle()
            }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = false

        var body: some View {
            CheckBoxView()
        }
    }

    static var previews: some View {
        CheckBoxViewHolder()
    }
}
