//
//  DocumentsListView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 13/5/22.
//

import SwiftUI

struct DocumentsListView: View {
    
    var documentsList = documentsData
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16){
                ForEach(documentsList) { document in
                    FileRowView(imageString: document.image,
                                nameString: document.name,
                                dateString: document.date)
                }
            }
        }
        .frame(width: 340, height: 480, alignment: .top)
    }
}

struct DocumentsListView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentsListView()
    }
}
