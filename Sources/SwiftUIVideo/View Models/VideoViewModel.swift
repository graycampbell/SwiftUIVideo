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
    @Published var timeControlStatus: AVPlayer.TimeControlStatus = .waitingToPlayAtSpecifiedRate
    @Published var isExpanded: Bool = false
    @Published var isScrubbing: Bool = false
    @Published var isShowingControls: Bool = true
    @Published var seekPosition: Double = 0
    
    private var timeObserver: Any?
    private var controlTimer: Timer? = nil
    private var cancellables = Set<AnyCancellable>()
    
    init(video: Video) {
        self.video = video
        
        let asset = AVAsset(url: video.url!)
        let playerItem = AVPlayerItem(asset: asset)
        
        self.player = AVPlayer(playerItem: playerItem)
        
        self.addTimeObserver()
        self.subscribeToStatusPublisher()
        self.subscribeToTimeControlStatusPublisher()
        self.subscribeToIsMutedPublisher()
    }
    
    deinit {
        guard let timeObserver = self.timeObserver else { return }
        
        self.player.removeTimeObserver(timeObserver)
        self.timeObserver = nil
        
        self.cancellables.forEach { $0.cancel() }
    }
}

// MARK: - Player

extension VideoViewModel {
    private func addTimeObserver() {
        let interval = CMTime(seconds: 1, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        
        self.timeObserver = self.player.addPeriodicTimeObserver(forInterval: interval, queue: .main) { time in
            guard !self.isScrubbing, let item = self.player.currentItem else { return }
            
            self.seekPosition = time.seconds / item.duration.seconds
        }
    }
    
    private func subscribeToStatusPublisher() {
        self.player
            .publisher(for: \.status)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] status in
                switch status {
                    case .readyToPlay:
                        self?.player.preroll(atRate: 1)
                        print("player.status == .readyToPlay")
                    case .failed:
                        print(self?.player.error ?? "player.status == .failed")
                    case .unknown:
                        print("player.status == .unknown")
                    default:
                        print("player.status == default")
                }
            }
            .store(in: &self.cancellables)
    }
    
    private func subscribeToTimeControlStatusPublisher() {
        self.player
            .publisher(for: \.timeControlStatus)
            .debounce(for: .milliseconds(80), scheduler: RunLoop.main)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] timeControlStatus in
                self?.timeControlStatus = timeControlStatus
                self?.startControlTimer()
            }
            .store(in: &self.cancellables)
    }
    
    private func subscribeToIsMutedPublisher() {
        self.player
            .publisher(for: \.isMuted)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isMuted in
                self?.objectWillChange.send()
                self?.startControlTimer()
            }
            .store(in: &self.cancellables)
    }
}

// MARK: - Control Timer

extension VideoViewModel {
    func startControlTimer() {
        self.controlTimer?.invalidate()
        
        guard self.timeControlStatus == .playing && !self.isScrubbing else { return }
        
        self.controlTimer = Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { timer in
            self.isShowingControls = false
            timer.invalidate()
        }
    }
}
