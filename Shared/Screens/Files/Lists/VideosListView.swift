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
                ForEach(videosList.videos) { video in
                    FileVideoRowView(item: video)
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
