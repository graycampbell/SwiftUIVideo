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
    @ObservedObject var viewModel = VideoViewModel()
    
    @State var isVideoExpanded: Bool = false
    
    @ViewBuilder var body: some View {
        VStack(spacing: 0) {
            VideoPlayerContainerView(player: self.viewModel.video.player, isExpanded: self.$isVideoExpanded)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            if !self.isVideoExpanded {
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
