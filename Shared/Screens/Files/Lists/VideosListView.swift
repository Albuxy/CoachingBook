//
//  VideosListView.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 13/5/22.
//

import SwiftUI

struct VideosListView: View {
    
    var videosList = videosData
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16){
                ForEach(videosData) { video in
                    FileRowView(imageString: video.image,
                                nameString: video.name,
                                dateString: video.date)
                }
            }
        }
        .frame(width: 340, height: 480, alignment: .top)
    }
}

struct VideosListView_Previews: PreviewProvider {
    static var previews: some View {
        VideosListView()
    }
}
