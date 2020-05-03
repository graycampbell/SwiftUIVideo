//
//  VideoViewModel.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import AVKit
import Combine
import Foundation

// MARK: Properties & Initializers

class VideoViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published var video: Video
    @Published var player: AVPlayer
    
    init(video: Video) {
        self.video = video
        self.player = AVPlayer(url: video.url!)
    }
}
