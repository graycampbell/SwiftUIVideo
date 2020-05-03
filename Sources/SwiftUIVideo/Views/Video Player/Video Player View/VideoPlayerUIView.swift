//
//  VideoPlayerUIView.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/3/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import UIKit
import AVKit

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
    
    // MARK: Initializers
    
    init(player: AVPlayer) {
        super.init(frame: .zero)
        
        self.player = player
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}
