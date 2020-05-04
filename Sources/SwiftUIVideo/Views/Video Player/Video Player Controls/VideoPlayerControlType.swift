//
//  VideoPlayerControlType.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/3/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import SwiftUI

extension VideoPlayerControl {
    enum ControlType {
        case play, pause, jumpBack, skipAhead, expand, minimize, mute, unmute
        
        var image: Image {
            switch self {
                case .play:
                    return Image(systemName: "play.fill")
                case .pause:
                    return Image(systemName: "pause.fill")
                case .jumpBack:
                    return Image(systemName: "gobackward.15")
                case .skipAhead:
                    return Image(systemName: "goforward.15")
                case .expand:
                    return Image(systemName: "arrow.up.left.and.arrow.down.right")
                case .minimize:
                    return Image(systemName: "arrow.down.right.and.arrow.up.left")
                case .unmute:
                    return Image(systemName: "speaker.slash.fill")
                case .mute:
                    return Image(systemName: "speaker.2.fill")
            }
        }
    }
}
