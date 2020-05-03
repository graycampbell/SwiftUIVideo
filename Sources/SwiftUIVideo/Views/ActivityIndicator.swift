//
//  ActivityIndicator.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import SwiftUI

// MARK: Properties & Initializers

struct ActivityIndicator: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView
    
    // MARK: Properties
    
    @Binding var isAnimating: Bool
}

// MARK: - UIViewRepresentable

extension ActivityIndicator {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        
        activityIndicatorView.startAnimating()
        
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        self.isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
