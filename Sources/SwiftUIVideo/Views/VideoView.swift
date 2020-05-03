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
                VideoPlayerContainerView(player: self.viewModel.player, isExpanded: self.$isVideoExpanded, seekPosition: self.$viewModel.seekPosition)
            }
            else {
                VideoPlayerContainerView(player: self.viewModel.player, isExpanded: self.$isVideoExpanded, seekPosition: self.$viewModel.seekPosition)
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
