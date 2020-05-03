//
//  VideoControlButtonType.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import SwiftUI
import Foundation

extension VideoControlButton {
    enum ButtonType {
        case play, pause, replay
        
        var image: Image {
            switch self {
                case .play:
                    return Image(systemName: "play.fill")
                case .pause:
                    return Image(systemName: "pause.fill")
                case .replay:
                    return Image("fa.undo.alt")
            }
        }
    }
}
