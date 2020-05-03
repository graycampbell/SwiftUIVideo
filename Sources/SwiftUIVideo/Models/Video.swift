//
//  Video.swift
//  SwiftUIVideo
//
//  Created by Gray Campbell on 5/2/20.
//  Copyright © 2020 Gray Campbell. All rights reserved.
//

import Foundation

// MARK: Properties & Initializers

struct Video {
    
    // MARK: Properties
    
    static let foxVillage = Video(
        title: "Fox Village",
        url: URL(string: "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.m3u8"),
        description: "Miyagi Zao Fox Village, also known as Kitsune Mura, is a tourist attraction and sanctuary for foxes in Shiroishi, Miyagi, Japan where visitors can feed and interact with foxes. The village's main exhibit is an open area where foxes roam around and visitors can enter to interact with and feed them, although attempting to pet or hand-feed the foxes is not advised as they may bite. There are over 100 foxes, including typical red and arctic foxes, foxes with uncommon coat colors, such as silver and platinum foxes, and red-arctic fox hybrids. The village also has rabbits, miniature horses, goats, and guinea pigs, in addition to gift and snack shops. In the spring, events are hosted in which visitors can hug fox kits. While the zoo has been dubbed the \"Cutest place on Earth,\" it has also received criticism due to the high density of foxes, which are normally solitary or live in small groups, foxes kept in cages, frequent fox fights, a perceived lack of greenery, and allegedly poor sanitation.\n\nSource: Wikipedia"
    )
    
    let title: String
    let url: URL?
    let description: String
}
