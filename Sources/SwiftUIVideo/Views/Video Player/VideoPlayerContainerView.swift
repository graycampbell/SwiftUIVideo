//
//  VideoPlayerContainerView.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/3/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import AVKit
import SwiftUI

struct VideoPlayerContainerView: View {
    @ObservedObject var viewModel: VideoViewModel
    
    var body: some View {
        ZStack {
            if self.viewModel.isExpanded {
                Color.black
                    .edgesIgnoringSafeArea(.all)
            }
            else {
                Color.black
            }
            
            VideoPlayerView(player: self.viewModel.player)
                .aspectRatio(1242.0 / 529.0, contentMode: .fit)
            
            VideoPlayerControlsView(viewModel: self.viewModel)
                .opacity(self.viewModel.isShowingControls ? 1 : 0)
                .animation(.easeInOut)
        }
        .onTapGesture(perform: self.toggleControls)
    }
    
    private func toggleControls() {
        self.viewModel.isShowingControls.toggle()
        self.viewModel.startControlTimer()
    }
}

struct VideoPlayerContainerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerContainerView(viewModel: VideoViewModel(video: Video.sintel))
    }
}
