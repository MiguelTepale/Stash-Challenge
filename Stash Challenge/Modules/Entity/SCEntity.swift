//
//  SCEntity.swift
//  Stash Challenge
//
//  Created by Miguel Tepale on 9/15/18.
//  Copyright © 2018 Miguel Tepale. All rights reserved.
//

import Foundation

struct SCEntity: Decodable {
    
    let success: Bool
    let status: Int
    let title: String
    let achievements: [Achievement]
    
    struct Achievement: Decodable {
        let id: Int
        let level: String
        let progress: Int
        let total: Int
        let bgImageUrl: String
        let accessible: Bool
    }
    
    private enum CodingKeys:CodingKey {
        case success
        case status
        case overview
        case title
        case achievements
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        success = try container.decode(Bool.self, forKey: .success)
        status = try container.decode(Int.self, forKey: .status)
        let nestedContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .overview)
        title = try nestedContainer.decode(String.self, forKey: .title)
        achievements = try container.decode([Achievement].self, forKey: .achievements)
    }
    
}
