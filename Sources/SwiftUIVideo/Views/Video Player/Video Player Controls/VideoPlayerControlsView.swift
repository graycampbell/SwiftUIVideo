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
    let player: AVPlayer
    
    @Binding var isExpanded: Bool
    @Binding var isShowingControls: Bool
    
    @State var isPlaying: Bool = false
    @State var seekPosition: Double = 0
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
            
            VStack {
                HStack {
                    if self.isExpanded {
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
                VideoPlayerControl(type: .jumpBack, action: self.jumpBack)
                
                if self.isPlaying {
                    VideoPlayerControl(type: .pause, action: self.pause)
                }
                else {
                    VideoPlayerControl(type: .play, action: self.play)
                }
                
                VideoPlayerControl(type: .skipAhead, action: self.skipAhead)
            }
            
            VStack {
                Spacer()
                
                Slider(value: self.$seekPosition, in: (0...1), onEditingChanged: self.sliderDidChange(_:))
                    .padding(.bottom, 20)
                    .padding(.horizontal, 20)
            }
        }
        .accentColor(.white)
        .animation(.none)
    }
    
    private func expand() {
        self.isExpanded = true
    }
    
    private func minimize() {
        self.isExpanded = false
    }
    
    private func play() {
        self.player.play()
        self.isPlaying = true
    }
    
    private func pause() {
        self.player.pause()
        self.isPlaying = false
    }
    
    private func jumpBack() {
        let seconds = max(0, self.player.currentTime().seconds - 15)
        
        self.seek(seconds: seconds)
    }
    
    private func skipAhead() {
        guard let currentItem = self.player.currentItem else { return }
        
        let seconds = min(currentItem.duration.seconds, self.player.currentTime().seconds + 15)
        
        self.seek(seconds: seconds)
    }
    
    private func sliderDidChange(_ value: Bool) {
        guard let currentItem = self.player.currentItem else { return }
        
        let seconds = self.seekPosition * currentItem.duration.seconds
        
        self.seek(seconds: seconds)
    }
    
    private func seek(seconds: Double) {
        let newTime = CMTime(seconds: seconds, preferredTimescale: 600)
        
        self.player.seek(to: newTime)
    }
}

struct VideoPlayerControlsView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerControlsView(player: Video.sintel.player, isExpanded: .constant(false), isShowingControls: .constant(true))
    }
}
