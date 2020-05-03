//
//  VideoViewModel.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import Combine
import Foundation

// MARK: Properties & Initializers

class VideoViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published var video: Video = .foxVillage
    @Published var isLoading: Bool = true
    @Published var isPlaying: Bool = false
    @Published var isShowingControls: Bool = true
}
