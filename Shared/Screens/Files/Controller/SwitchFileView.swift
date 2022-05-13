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

  var body: some View {
     VStack {
        switch self.userScreenEntry {
        case .documents:
            DocumentsListView()
        case .images:
            ImagesListView()
        case .videos:
            VideosListView()
        }
     }
  }
}

struct SwitchFileView_Previews: PreviewProvider {
    @State static var value: FileEntries = .documents
    static var previews: some View {
        SwitchFileView(userScreenEntry: $value)
    }
}
