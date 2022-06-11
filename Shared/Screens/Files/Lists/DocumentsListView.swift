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
                ForEach(documentsList.documents) { document in
                    FileDocumentRowView(item: document)
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
