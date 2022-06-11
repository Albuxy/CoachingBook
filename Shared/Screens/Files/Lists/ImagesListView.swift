//
//  ImagesListView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 13/5/22.
//

import SwiftUI

struct ImagesListView: View {
    
    @ObservedObject var imagesList: ImageModelList
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16){
                ForEach(imagesList.images) { image in
                    FileImageRowView(item: image)
                }
            }
        }
        .frame(width: 340, height: 480, alignment: .top)
    }
}

struct ImagesListView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesListView(imagesList: ImageModelList())
    }
}
