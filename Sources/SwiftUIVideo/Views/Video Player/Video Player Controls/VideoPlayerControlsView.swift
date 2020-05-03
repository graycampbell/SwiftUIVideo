//
//  VideoPlayerControlsView.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/3/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import AVKit
import SwiftUI
import Combine

struct VideoPlayerControlsView: View {
    @ObservedObject var viewModel: VideoViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
            
            VStack {
                HStack {
                    if self.viewModel.isExpanded {
                        VideoPlayerControl(type: .minimize, action: self.minimize)
                    }
                    else {
                        VideoPlayerControl(type: .expand, action: self.expand)
                    }
                    
                    Spacer()
                }
                .padding([.top, .leading], 5)
                
                Spacer()
            }
            
            HStack(spacing: 50) {
                if self.viewModel.status == .waitingToPlayAtSpecifiedRate {
                    ActivityIndicatorView(style: .large, color: .white)
                        .padding()
                        .background(Color.secondary)
                        .cornerRadius(15)
                }
                else {
                    VideoPlayerControl(type: .jumpBack, action: self.jumpBack)
                    
                    if self.viewModel.status == .playing {
                        VideoPlayerControl(type: .pause, action: self.pause)
                    }
                    else {
                        VideoPlayerControl(type: .play, action: self.play)
                    }
                    
                    VideoPlayerControl(type: .skipAhead, action: self.skipAhead)
                }
            }
            
            VStack {
                Spacer()
                
                Slider(value: self.$viewModel.seekPosition, in: (0...1), onEditingChanged: self.sliderDidChange(_:))
                    .padding(.bottom, 10)
                    .padding(.horizontal, 20)
            }
        }
        .accentColor(.white)
        .foregroundColor(.white)
        .animation(.none)
    }
    
    private func expand() {
        self.viewModel.isExpanded = true
        self.pause()
    }
    
    private func minimize() {
        self.viewModel.isExpanded = false
        self.pause()
    }
    
    private func play() {
        self.viewModel.player.play()
    }
    
    private func pause() {
        self.viewModel.player.pause()
    }
    
    private func jumpBack() {
        let seconds = max(0, self.viewModel.player.currentTime().seconds - 15)
        
        self.seek(seconds: seconds)
    }
    
    private func skipAhead() {
        guard let item = self.viewModel.player.currentItem else { return }
        
        let seconds = min(item.duration.seconds, self.viewModel.player.currentTime().seconds + 15)
        
        self.seek(seconds: seconds)
    }
    
    private func sliderDidChange(_ isScrubbing: Bool) {
        guard let item = self.viewModel.player.currentItem else { return }
        
        let seconds = self.viewModel.seekPosition * item.duration.seconds
        
        self.seek(seconds: seconds) { finished in
            guard finished else { return }
            
            self.viewModel.isScrubbing = isScrubbing
        }
    }
    
    private func seek(seconds: Double, completionHandler: @escaping (Bool) -> Void = { _ in }) {
        let newTime = CMTime(seconds: seconds, preferredTimescale: 600)
        
        self.viewModel.player.seek(to: newTime, completionHandler: completionHandler)
    }
}

struct VideoPlayerControlsView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerControlsView(viewModel: VideoViewModel(video: Video.sintel))
    }
}
