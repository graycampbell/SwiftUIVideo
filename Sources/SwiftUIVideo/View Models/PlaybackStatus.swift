//
//  PlaybackStatus.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import Combine
import Foundation

// MARK: Properties & Initializers

struct PlaybackStatus {
    
    // MARK: Properties
    
    var isLoading: Bool = true
    var isPlaying: Bool = false
    var isShowingControls: Bool = true
    var didFinishPlayback: Bool = false
}
