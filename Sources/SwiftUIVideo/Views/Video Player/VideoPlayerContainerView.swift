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
    let player: AVPlayer
    
    @Binding var isExpanded: Bool
    @Binding var isScrubbing: Bool
    @Binding var seekPosition: Double
    @Binding var controlTimer: Timer?
    
    @State var isShowingControls: Bool = true
    
    var body: some View {
        ZStack {
            if self.isExpanded {
                Color.black
                    .edgesIgnoringSafeArea(.all)
            }
            else {
                Color.black
            }
            
            VideoPlayerView(player: self.player)
                .aspectRatio(1242.0 / 529.0, contentMode: .fit)
            VideoPlayerControlsView(player: self.player, isExpanded: self.$isExpanded, isScrubbing: self.$isScrubbing, isShowingControls: self.$isShowingControls, seekPosition: self.$seekPosition, controlTimer: self.$controlTimer)
                .opacity(self.isShowingControls ? 1 : 0)
                .animation(.easeInOut)
        }
        .onTapGesture(perform: self.toggleControls)
    }
    
    private func toggleControls() {
        self.isShowingControls.toggle()
        
        guard self.player.timeControlStatus == .playing else { return }
        
        self.startTimer()
    }
    
    private func startTimer() {
        self.controlTimer?.invalidate()
        
        self.controlTimer = Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { timer in
            self.isShowingControls = false
            timer.invalidate()
        }
    }
}

struct VideoPlayerContainerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerContainerView(player: AVPlayer(url: Video.sintel.url!), isExpanded: .constant(false), isScrubbing: .constant(false), seekPosition: .constant(0), controlTimer: .constant(nil))
    }
}
