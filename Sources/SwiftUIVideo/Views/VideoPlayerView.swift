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

struct VideoPlayerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = AVPlayerViewController
    
    // MARK: Properties
    
    var url: URL
}

// MARK: - UIViewRepresentable

extension VideoPlayerView {
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = AVPlayer(url: self.url)
        
        return playerViewController
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}
