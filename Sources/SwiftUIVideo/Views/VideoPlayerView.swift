//
//  VideoPlayerView.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import AVKit
import SwiftUI

// MARK: Properties & Initializers

struct VideoPlayerView: UIViewRepresentable {
    typealias UIViewType = VideoPlayerUIView
    
    // MARK: Properties
    
    let player: AVPlayer
}

// MARK: - UIViewRepresentable

extension VideoPlayerView {
    func makeUIView(context: Context) -> VideoPlayerUIView {
        return VideoPlayerUIView(player: self.player)
    }
    
    func updateUIView(_ uiView: VideoPlayerUIView, context: Context) {
        
    }
}
