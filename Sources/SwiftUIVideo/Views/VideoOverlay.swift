//
//  VideoOverlay.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import SwiftUI

struct VideoOverlay: View {
    @ObservedObject var viewModel: VideoViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack(spacing: 50) {
                if self.viewModel.playbackStatus.isLoading {
                    ActivityIndicator(isAnimating: self.$viewModel.playbackStatus.isLoading)
                }
                else if self.viewModel.playbackStatus.didFinishPlayback {
                    VideoControlButton(type: .replay, action: self.play)
                }
                else if self.viewModel.playbackStatus.isPlaying {
                    VideoControlButton(type: .pause, action: self.pause)
                }
                else {
                    VideoControlButton(type: .play, action: self.play)
                }
            }
            .foregroundColor(.white)
            .opacity(0.9)
        }
    }
    
    private func play() {
        self.viewModel.playbackStatus.isPlaying = true
        self.viewModel.playbackStatus.isShowingControls = false
    }
    
    private func pause() {
        self.viewModel.playbackStatus.isPlaying = false
    }
}

struct VideoControls_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
