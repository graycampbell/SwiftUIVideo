//
//  VideoView.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import SwiftUI

struct VideoView: View {
    @ObservedObject var viewModel = VideoViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color.black
                    .frame(maxWidth: .infinity)
                VideoPlayerView(viewModel: self.viewModel)
                    .onTapGesture(perform: self.toggleControls)
                
                if self.viewModel.playbackStatus.isShowingControls {
                    VideoOverlay(viewModel: self.viewModel)
                        .onTapGesture(perform: self.toggleControls)
                }
            }
            .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fit)
            .frame(maxWidth: .infinity)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text(self.viewModel.video.title)
                        .font(.title)
                    
                    Text(self.viewModel.video.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                }
                .padding(20)
            }
        }
    }
    
    private func toggleControls() {
        self.viewModel.playbackStatus.isShowingControls.toggle()
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
