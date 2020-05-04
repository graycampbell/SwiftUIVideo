//
//  ActivityIndicatorView.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/3/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: Properties & Initializers

struct ActivityIndicatorView: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView
    
    // MARK: Properties
    
    let style: UIActivityIndicatorView.Style
    let color: UIColor
}

// MARK: - UIViewRepresentable

extension ActivityIndicatorView {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: self.style)
        
        activityIndicatorView.color = self.color
        activityIndicatorView.startAnimating()
        
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}
