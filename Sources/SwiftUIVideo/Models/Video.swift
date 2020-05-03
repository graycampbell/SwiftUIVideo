//
//  Video.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import AVKit
import Foundation

// MARK: Properties & Initializers

struct Video {
    
    // MARK: Properties
    
    static let sintel = Video(
        title: "Sintel",
        url: URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"),
        description: "Sintel, code-named Project Durian during production, is a 2010 computer-animated fantasy short film. It was the third Blender \"open movie.\" It was produced by Ton Roosendaal, chairman of the Blender Foundation, written by Esther Wouda, and directed by Colin Levy, at the time an artist at Pixar. It was made at the Blender Institute, part of the Blender Foundation. The plot follows the character, Sintel, who is tracking down her pet Scales, a dragon. Just like the other Blender \"open movies,\" the film was made using Blender, a free and open source software application for animation, created and supported by the Blender Foundation."
    )
    
    let title: String
    let url: URL?
    let description: String
    
    var player: AVPlayer {
        return AVPlayer(url: self.url!)
    }
}
