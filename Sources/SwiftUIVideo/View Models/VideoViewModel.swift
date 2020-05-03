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
    @Published var seekPosition: Double = 0
    @Published var controlTimer: Timer? = nil
    
    private var timeObserver: Any?
    
    init(video: Video) {
        self.video = video
        self.player = AVPlayer(url: video.url!)
        
        let interval = CMTime(seconds: 0.5, preferredTimescale: 600)
        
        self.timeObserver = self.player.addPeriodicTimeObserver(forInterval: interval, queue: .main) { time in
            guard let currentItem = self.player.currentItem else { return }
            
            self.seekPosition = time.seconds / currentItem.duration.seconds
        }
    }
    
    deinit {
        guard let timeObserver = self.timeObserver else { return }
        
        self.player.removeTimeObserver(timeObserver)
    }
}
