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
    
    @ObservedObject var viewModel: VideoViewModel
}

// MARK: - UIViewRepresentable

extension VideoPlayerView {
    func makeUIView(context: Context) -> VideoPlayerUIView {
        return VideoPlayerUIView(viewModel: self.viewModel)
    }
    
    func updateUIView(_ uiView: VideoPlayerUIView, context: Context) {
        self.viewModel.isPlaying ? uiView.play() : uiView.pause()
    }
}
