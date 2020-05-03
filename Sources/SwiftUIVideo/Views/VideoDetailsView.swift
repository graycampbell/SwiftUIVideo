//
//  VideoDetailsView.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/3/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import SwiftUI

struct VideoDetailsView: View {
    let video: Video
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(self.video.title)
                    .font(.title)
                
                Text(self.video.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding(20)
        }
    }
}

struct VideoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailsView(video: .sintel)
    }
}
