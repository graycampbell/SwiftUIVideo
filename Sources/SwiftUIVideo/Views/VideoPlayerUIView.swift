//
//  VideoPlayerUIView.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import UIKit
import AVFoundation

// MARK: Properties & Initializers

class VideoPlayerUIView: UIView {
    
    // MARK: Properties
    
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    private var playerLayer: AVPlayerLayer {
        return self.layer as! AVPlayerLayer
    }
    
    private var player: AVPlayer? {
        get { self.playerLayer.player }
        set { self.playerLayer.player = newValue }
    }
    
    private var playerLooper: AVPlayerLooper?
    
    // MARK: Initializers
    
    init(video: Video) {
        super.init(frame: .zero)
        
        let playerItem = AVPlayerItem(url: video.url!)
        let queuePlayer = AVQueuePlayer(playerItem: playerItem)
        
        self.player = queuePlayer
        self.playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
        
        self.player?.play()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}
