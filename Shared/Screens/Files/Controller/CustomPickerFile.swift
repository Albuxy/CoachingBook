//
//  CustomPickerFile.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 13/5/22.
//

import Foundation
import SwiftUI

struct FileItem: Hashable {
  var titleString: String
  var imageString: String
  var numberInt: Int
  var selectionIndex: FileEntries
}

struct CustomPickerFileView: View {

    @StateObject var selection = FilesModel()
      
    let listOfItems = [FileItem(titleString: "documents_title", imageString: "ic_document", numberInt: documentsData.count, selectionIndex: .documents),
                       FileItem(titleString: "images_title", imageString: "ic_image", numberInt: imagesData.count, selectionIndex: .images),
                       FileItem(titleString: "videos_title", imageString: "ic_video", numberInt: videosData.count, selectionIndex: .videos)]

  var body: some View {
      HStack(spacing: 23){
          ForEach(listOfItems, id: \.self) { item in
              TypeOfFileCard(titleString: item.titleString,
                             imageString: item.imageString,
                             numberInt: item.numberInt,
                             selectionIndex: item.selectionIndex,
                             selection: self.selection)
          }
      }
  }
}
