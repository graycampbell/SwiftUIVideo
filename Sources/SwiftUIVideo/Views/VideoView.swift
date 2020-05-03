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
    
    private let aspectRatio = CGSize(width: 1242.0 / 529.0, height: 1)
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color.black
                    .frame(maxWidth: .infinity)
                VideoPlayerView(url: self.viewModel.video.url!)
            }
            .aspectRatio(self.aspectRatio, contentMode: .fit)
            .frame(maxWidth: .infinity)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text(self.viewModel.video.title)
                        .font(.title)
                    
                    Text(self.viewModel.video.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                }
                .padding(20)
            }
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
