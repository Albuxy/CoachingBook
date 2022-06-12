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
                if imagesList.images.count == 0 {
                    Text("images_empty_title".localized(LocalizationService.shared.language))
                        .font(.system(size: 18))
                        .foregroundColor(.black).opacity(0.8)
                        .padding(.top, 10)
                } else {
                    ForEach(imagesList.images) { image in
                        FileImageRowView(image: image, listImages: imagesList)
                    }
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
