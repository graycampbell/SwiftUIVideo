//
//  VideoPlayerUIView.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import UIKit
import SwiftUI
import Combine
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
    
    private var playerItem: AVPlayerItem?
    private var playerItemContext = 0
    
    @ObservedObject var viewModel: VideoViewModel
    
    private var cancellable: AnyCancellable?
    
    // MARK: Initializers
    
    init(viewModel: VideoViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: .zero)
        
        self.loadAsset(url: self.viewModel.video.url!) { [weak self] asset in
            self?.configurePlayerItem(with: asset)
        }
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    deinit {
        self.playerItem?.removeObserver(self, forKeyPath: #keyPath(AVPlayerItem.status))
    }
}

// MARK: - Controls

extension VideoPlayerUIView {
    func play() {
        self.player?.play()
    }
    
    func pause() {
        self.player?.pause()
    }
}

// MARK: - Asset

extension VideoPlayerUIView {
    private func loadAsset(url: URL, completion: ((AVAsset) -> Void)?) {
        let asset = AVAsset(url: url)
        
        asset.loadValuesAsynchronously(forKeys: ["playable"]) {
            var error: NSError? = nil
            
            let status = asset.statusOfValue(forKey: "playable", error: &error)
            
            switch status {
                case .loaded:
                    completion?(asset)
                case .failed:
                    print(".failed")
                case .cancelled:
                    print(".cancelled")
                default:
                    print("default")
            }
        }
    }
}

// MARK: - Player Item

extension VideoPlayerUIView {
    private func configurePlayerItem(with asset: AVAsset) {
        self.playerItem = AVPlayerItem(asset: asset)
        self.cancellable = self.playerItem?
            .publisher(for: \.status, options: [.initial, .new])
            .sink { [weak self] status in
                switch status {
                    case .readyToPlay:
                        print(".readyToPlay")
                        self?.play()
                        self?.viewModel.isLoading = false
                        self?.viewModel.isPlaying = true
                        self?.viewModel.isShowingControls = false
                    case .failed:
                        print(".failed")
                    case .unknown:
                        print(".unknown")
                    @unknown default:
                        print("@unknown default")
                }
            }
        
        DispatchQueue.main.async { [weak self] in
            self?.player = AVPlayer(playerItem: self?.playerItem!)
        }
    }
}
