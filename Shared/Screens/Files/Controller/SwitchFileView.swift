//
//  SwitchFileView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 13/5/22.
//

import Foundation
import SwiftUI

class FilesModel: ObservableObject {
    @Published var showSection: FileEntries = .documents
}

enum FileEntries {
  case documents, images, videos
}

struct SwitchFileView: View {

  @Binding var userScreenEntry: FileEntries
    @ObservedObject var documentsList: DocumentModelList
    @ObservedObject var imagesList: ImageModelList
    @ObservedObject var videoslist: VideoModelList

  var body: some View {
     VStack {
         switch self.userScreenEntry {
         case .documents:
             DocumentsListView(documentsList: documentsList)
         case .images:
             ImagesListView(imagesList: imagesList)
         case .videos:
             VideosListView(videosList: videoslist)
         }
     }
  }
}

struct SwitchFileView_Previews: PreviewProvider {
    @State static var value: FileEntries = .documents
    static var previews: some View {
        SwitchFileView(userScreenEntry: $value, documentsList: DocumentModelList(), imagesList: ImageModelList(), videoslist: VideoModelList())
    }
}
