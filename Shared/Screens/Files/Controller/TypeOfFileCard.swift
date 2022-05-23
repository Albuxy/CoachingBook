//
//  TypeOfFileCard.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 13/5/22.
//

import SwiftUI

struct TypeOfFileCard: View {
    
    var titleString: String
    var imageString: String
    var numberInt: Int
    
    var selectionIndex: FileEntries

    @StateObject var selection = FilesModel()
    
    var body: some View {
        ZStack{
            Button {
                self.selection.showSection = self.selectionIndex
            } label: {
                VStack(alignment: .center, spacing: 10) {
                    Image(imageString)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .strokeBorder(Color.clear, lineWidth: 1)
                                .background(
                                    RoundedRectangle(cornerRadius: 40).fill(Color("secondDarkBlueColor"))
                                )
                        )
                    VStack(alignment: .center, spacing: 6) {
                        Text(titleString.localized(LocalizationService.shared.language))
                            .font(.system(size: 15))
                            .foregroundColor(selection.showSection == self.selectionIndex
                                             ? .white : .black)
                        Text("upload_title".localized(LocalizationService.shared.language))
                            .font(.system(size: 13))
                            .foregroundColor(selection.showSection == self.selectionIndex
                                             ? .white.opacity(0.8) : .black.opacity(0.8))
                        + Text("\(numberInt)")
                            .font(.system(size: 13))
                            .foregroundColor(selection.showSection == self.selectionIndex
                                             ? .white.opacity(0.8) : .black.opacity(0.8))
                    }
                }
            }
            .padding(.top, 10)
            
            .frame(width: 100, height: 117, alignment: .top)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.clear, lineWidth: 3)
                    .background(
                        RoundedRectangle(cornerRadius: 10).fill(selection.showSection == self.selectionIndex
                                                                ? Color("blueColor"): Color.white)
                    )
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
            )
        }
    }
}

struct TypeOfFileCard_Previews: PreviewProvider {
    @State static var value = false
    static var previews: some View {
        TypeOfFileCard(titleString: "documents_title",
                       imageString: "ic_document",
                       numberInt: 3,
                       selectionIndex: .documents)
    }
}
