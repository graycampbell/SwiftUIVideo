//
//  VideoPlayerControl.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/3/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import SwiftUI

struct VideoPlayerControl: View {
    let type: ControlType
    let action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            self.type.image
                .imageScale(.large)
                .frame(width: 50, height: 50)
        }
    }
}

struct VideoPlayerControl_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerControl(type: .play, action: {})
    }
}
