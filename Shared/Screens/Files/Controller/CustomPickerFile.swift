//
//  CustomPickerFile.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 13/5/22.
//

import Foundation
import SwiftUI

struct FileItem: Hashable {
  var title: String
  var imageString: String
  var numberInt: Int
  var selectionIndex: FileEntries
}

struct CustomPickerFileView: View {

  @StateObject var selection = FilesModel()
    
  @ObservedObject var documentsList: DocumentModelList
  @ObservedObject var imagesList: ImageModelList
  @ObservedObject var videoslist: VideoModelList

  var body: some View {

      let item1 = FileItem(title: "documents_title", imageString: "ic_document", numberInt: documentsList.documents.count , selectionIndex: .documents)
      let item2 = FileItem(title: "images_title", imageString: "ic_image", numberInt: imagesList.images.count , selectionIndex: .images)
      let item3 = FileItem(title: "videos_title", imageString: "ic_video", numberInt: videoslist.videos.count , selectionIndex: .videos)

    return VStack {
        TypeOfFileCard(selection: selection, items: [item1, item2, item3])
    }
  }
}

struct TypeOfFileCard: View {

  @StateObject var selection = FilesModel()
  var items: [FileItem]

  var body: some View {

    return
      VStack {
        HStack(spacing: 15) {
          ForEach(items, id: \.self) { item in
              FileItemCard(item: item,
                           selectionIndex: item.selectionIndex,
                           selection: self.selection)
          }
        }
      }
  }
}
