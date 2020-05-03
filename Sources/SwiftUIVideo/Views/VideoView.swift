//
//  VideoView.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import AVKit
import SwiftUI

struct VideoView: View {
    @ObservedObject var viewModel = VideoViewModel(video: .sintel)
    
    @State var isVideoExpanded: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            if self.isVideoExpanded {
                VideoPlayerContainerView(player: self.viewModel.player, isExpanded: self.$isVideoExpanded, isScrubbing: self.$viewModel.isScrubbing, seekPosition: self.$viewModel.seekPosition, controlTimer: self.$viewModel.controlTimer)
            }
            else {
                VideoPlayerContainerView(player: self.viewModel.player, isExpanded: self.$isVideoExpanded, isScrubbing: self.$viewModel.isScrubbing, seekPosition: self.$viewModel.seekPosition, controlTimer: self.$viewModel.controlTimer)
                    .aspectRatio(1242.0 / 529.0, contentMode: .fit)
                
                VideoDetailsView(video: self.viewModel.video)
            }
        }
        .statusBar(hidden: self.isVideoExpanded)
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
