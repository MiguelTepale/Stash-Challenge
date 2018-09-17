//
//  SCEntity.swift
//  Stash Challenge
//
//  Created by Miguel Tepale on 9/15/18.
//  Copyright © 2018 Miguel Tepale. All rights reserved.
//

import Foundation
import UIKit

struct SCEntity: Decodable {
    
    let success: Bool
    let status: Int
    let title: String
    let rank: [Rank]
    
    struct Rank: Decodable {
        let id: Int
        let level: String
        let progress: Int
        let total: Int
        let bgImageUrl: String
        let accessible: Bool
    }
    
    private enum CodingKeys: CodingKey {
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
        rank = try container.decode([Rank].self, forKey: .achievements)
    }
    
}
