//
//  SCInteractor.swift
//  Stash Challenge
//
//  Created by Miguel Tepale on 9/15/18.
//  Copyright © 2018 Miguel Tepale. All rights reserved.
//

import Foundation

class SCInteractor {
    
    func fetchUserAchievements() {
        
        guard let filePath = Bundle.main.url(forResource: "achievements", withExtension: "json") else {
            print("File path cannot be found")
            return
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let data = try Data(contentsOf: filePath, options: [])
            let json = try decoder.decode(SCEntity.self, from: data)
            print(json)
        }
        catch {
            print("Something went wrong with fetching 'achievement.json'")
        }
    }
    
}
