//
//  VideoControls.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import SwiftUI

struct VideoControls: View {
    @ObservedObject var viewModel: VideoViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack(spacing: 50) {
                if self.viewModel.isLoading {
                    ActivityIndicator(isAnimating: self.$viewModel.isLoading)
                }
                else if self.viewModel.isPlaying {
                    VideoControl(systemImageName: "pause.fill", action: self.pause)
                }
                else {
                    VideoControl(systemImageName: "play.fill", action: self.play)
                }
            }
            .foregroundColor(.white)
            .opacity(0.9)
        }
    }
    
    private func play() {
        self.viewModel.isPlaying = true
        self.viewModel.isShowingControls = false
    }
    
    private func pause() {
        self.viewModel.isPlaying = false
    }
}

struct VideoControls_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
