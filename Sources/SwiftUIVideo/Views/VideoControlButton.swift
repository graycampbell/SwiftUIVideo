//
//  VideoControlButton.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import SwiftUI

struct VideoControlButton: View {
    let type: ButtonType
    let action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            self.type.image
                .imageScale(.large)
                .frame(width: 50, height: 50)
        }
    }
}

struct VideoControl_Previews: PreviewProvider {
    static var previews: some View {
        VideoControlButton(type: .play, action: {})
    }
}
