//
//  VideoListRowView.swift
//  Africa
//
//  Created by Omar Abdulrahman on 1/6/22.
//

import SwiftUI

struct VideoListRowView: View {
    
    // MARK: - PROPERTIES
    let video: Video
    // MARK: - BODY
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(8)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .shadow(radius: 4)
            } // : ZSTACK
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

// MARK: - PREVIEW
struct VideoListRowView_Previews: PreviewProvider {
    
    static var videos: [Video] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        VideoListRowView(video: videos[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
