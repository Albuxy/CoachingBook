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
  @ObservedObject var documentsList = DocumentModelList()
  @ObservedObject var imagesList = ImageModelList()
  @ObservedObject var videoslist = VideoModelList()
}

enum FileEntries {
  case documents, images, videos
}

struct SwitchFileView: View {

  @Binding var userScreenEntry: FileEntries
  @ObservedObject var viewModel: FilesModel

  var body: some View {
     VStack {
        switch self.userScreenEntry {
        case .documents:
            DocumentsListView(documentsList: viewModel.documentsList)
        case .images:
            ImagesListView(imagesList: viewModel.imagesList)
        case .videos:
            VideosListView(videosList: viewModel.videoslist)
        }
     }
  }
}

struct SwitchFileView_Previews: PreviewProvider {
    @State static var value: FileEntries = .documents
    static var previews: some View {
        SwitchFileView(userScreenEntry: $value, viewModel: FilesModel())
    }
}
