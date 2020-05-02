//
//  VideoPlayerView.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import SwiftUI
import AVFoundation

// MARK: Properties & Initializers

struct VideoPlayerView: UIViewRepresentable {
    typealias UIViewType = VideoPlayerUIView
    
    // MARK: Properties
    
    let video: Video
}

// MARK: - UIViewRepresentable

extension VideoPlayerView {
    func makeUIView(context: Context) -> VideoPlayerUIView {
        return VideoPlayerUIView(video: self.video)
    }
    
    func updateUIView(_ uiView: VideoPlayerUIView, context: Context) {
        
    }
}
