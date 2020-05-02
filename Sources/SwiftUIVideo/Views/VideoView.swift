//
//  VideoView.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import SwiftUI

struct VideoView: View {
    @ObservedObject var viewModel = VideoViewModel()
    
    var body: some View {
        VideoPlayerView(video: self.viewModel.video)
            .padding(20)
            .navigationBarTitle(self.viewModel.video.title)
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
