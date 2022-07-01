//
//  VideosListView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 13/5/22.
//

import SwiftUI

struct VideosListView: View {
    
    @ObservedObject var videosList: VideoModelList
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16){
                if videosList.videos.count == 0 {
                    Text("videos_empty_title".localized(LocalizationService.shared.language))
                        .font(.system(size: 18))
                        .foregroundColor(.black).opacity(0.8)
                        .padding(.top, 10)
                } else {
                    ForEach(videosList.videos) { video in
                        FileVideoRowView(video: video, listVideos: videosList)
                    }
                }
            }
        }
        .frame(width: 340, height: 480, alignment: .top)
    }
}

struct VideosListView_Previews: PreviewProvider {
    static var previews: some View {
        VideosListView(videosList: VideoModelList())
    }
}
