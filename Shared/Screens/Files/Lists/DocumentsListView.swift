//
//  DocumentsListView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 13/5/22.
//

import SwiftUI

struct DocumentsListView: View {
    
    @ObservedObject var documentsList: DocumentModelList
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16){
                if documentsList.documents.count == 0 {
                    Text("documents_empty_title".localized(LocalizationService.shared.language))
                        .font(.system(size: 18))
                        .foregroundColor(.black).opacity(0.8)
                        .padding(.top, 10)
                } else {
                    ForEach(documentsList.documents) { document in
                        FileDocumentRowView(document: document, listDocuments: documentsList )
                    }
                }
            }
        }
        .frame(width: 340, height: 480, alignment: .top)
    }
}

struct DocumentsListView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentsListView(documentsList: DocumentModelList())
    }
}
