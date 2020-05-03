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
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: Initializers
    
    init(viewModel: VideoViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: .zero)
        
        NotificationCenter.default
            .publisher(for: .AVPlayerItemDidPlayToEndTime)
            .sink { [weak self] _ in
                self?.viewModel.playbackStatus.didFinishPlayback = true
                self?.viewModel.playbackStatus.isShowingControls = true
            }
            .store(in: &self.cancellables)
        
        self.loadAsset(url: self.viewModel.video.url!) { [weak self] asset in
            self?.configurePlayerItem(with: asset)
        }
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    deinit {
        self.cancellables.forEach { $0.cancel() }
    }
}

// MARK: - Controls

extension VideoPlayerUIView {
    func play() {
        guard self.player?.timeControlStatus == .paused else { return }
        
        if self.viewModel.playbackStatus.didFinishPlayback {
            self.player?.seek(to: .zero)
            self.viewModel.playbackStatus.didFinishPlayback = false
        }
        
        self.player?.play()
    }
    
    func pause() {
        guard self.player?.timeControlStatus == .playing else { return }
        
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
        self.playerItem?
            .publisher(for: \.status, options: [.initial, .new])
            .sink { [weak self] status in
                switch status {
                    case .readyToPlay:
                        guard !(self?.viewModel.playbackStatus.didFinishPlayback ?? false) else { return }
                        
                        self?.play()
                        self?.viewModel.playbackStatus.isLoading = false
                        self?.viewModel.playbackStatus.isPlaying = true
                        self?.viewModel.playbackStatus.isShowingControls = false
                    case .failed:
                        print(".failed")
                    case .unknown:
                        print(".unknown")
                    default:
                        print(".default")
                }
            }
            .store(in: &self.cancellables)
        
        DispatchQueue.main.async { [weak self] in
            self?.player = AVPlayer(playerItem: self?.playerItem!)
        }
    }
}
