//
//  SCEntity.swift
//  Stash Challenge
//
//  Created by Miguel Tepale on 9/15/18.
//  Copyright © 2018 Miguel Tepale. All rights reserved.
//

import Foundation
import UIKit

struct SCEntity  {
    
    var success: Bool
    var status: Int
    var title: String
    var achievements = [Achievement]()
    
    class Achievement {
        
        let id: Int
        let level: String
        let progress: Int
        let total: Int
        let bgImageUrl: String
        let isAccessible: Bool
        var image: UIImage?
        
        init(with id:Int, level: String, progress: Int, total: Int, bgImageUrl: String, isAccessible: Bool) {
            self.id = id
            self.level = level
            self.progress = progress
            self.total = total
            self.bgImageUrl = bgImageUrl
            self.isAccessible = isAccessible
        }
        
    }
    
    init(with jsonDictionary: [String:Any]) {
        
        let success = jsonDictionary["success"] as? Bool ?? false
        let status = jsonDictionary["status"] as? Int ?? 400
        let overview = jsonDictionary["overview"] as? [String:Any] ?? [:]
        let title = overview["title"] as? String ?? "Title not available"
        let achievementsDictionary = jsonDictionary["achievements"] as? [[String:Any]] ??  [[:]]
        
        for achievement in achievementsDictionary {
            
            let id = achievement["id"] as? Int ?? -1
            let level = achievement["level"] as? String ?? "?"
            let progress = achievement["progress"] as? Int ?? 0
            let total = achievement["total"] as? Int ?? 0
            let bgImageUrl = achievement["bg_image_url"] as? String ?? "Insert 'question mark' image"
            let accessible = achievement["accessible"] as? Bool ?? false
            
            let newAchievement = Achievement(with: id, level: level, progress: progress, total: total, bgImageUrl: bgImageUrl, isAccessible: accessible)
            self.achievements.append(newAchievement)
            
        }
        self.success = success
        self.status = status
        self.title = title
    }
    
}
