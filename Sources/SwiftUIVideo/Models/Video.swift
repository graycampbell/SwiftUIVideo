//
//  Video.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import Foundation

// MARK: Properties & Initializers

struct Video {
    
    // MARK: Properties
    
    static let foxVillage = Video(
        title: "Fox Village",
        url: URL(string: "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.m3u8")
    )
    
    let title: String
    let url: URL?
}
