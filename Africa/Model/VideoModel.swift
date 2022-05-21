//
//  VideoModel.swift
//  Africa
//
//  Created by Omar Abdulrahman on 1/6/22.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
