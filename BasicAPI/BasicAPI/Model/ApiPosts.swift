//
//  ApiPosts.swift
//  BasicAPI
//
//  Created by Spencer Hurd on 2/9/22.
//

import Foundation

struct ApiPosts: Codable, Identifiable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
